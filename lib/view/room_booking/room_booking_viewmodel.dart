import 'package:flutter/material.dart';
import 'package:mindinventory_practical/utils/common_utils.dart';

import '../../models/hotel_model.dart';

class RoomBookingViewModel with ChangeNotifier {
  BuildContext? context;
  List<Room> rooms = [];

  void attachContext(BuildContext context) {
    this.context = context;
  }

  void addRoom() {
    rooms.add(Room());
    notifyListeners();
  }

  void removeRoom(int index) {
    rooms.removeAt(index);
    notifyListeners();
  }

  bool validate() {
    bool isRedirect = true;
    for (Room room in rooms) {
      if (room.members != null && room.members!.length > 3) {
        isRedirect = false;
        break;
      }
    }

    if (!isRedirect) {
      CommonUtils.showToast("The 1 room should have max 3 members.");
    } else {
      for (Room room in rooms) {
        if (room.members != null && room.members!.isNotEmpty) {
          if (room.members!.where((element) => element.firstName == null || element.firstName!.isEmpty || element.lastName == null || element.lastName!.isEmpty || element.dob == null).toList().length > 0) {
            isRedirect = false;
          }
        } else {
          isRedirect = false;
        }

        if (room.children != null && room.children!.isNotEmpty) {
          if (room.children!.where((element) => element.firstName == null || element.firstName!.isEmpty || element.lastName == null || element.lastName!.isEmpty || element.dob == null).toList().length > 0) {
            isRedirect = false;
          }
        }
      }

      if (!isRedirect) {
        CommonUtils.showToast("The room should not have black member entry.");
      } else {
        for (Room room in rooms) {
          if (room.children != null && room.children!.length > 0) {
            if (room.children!
                .where((element) {
              return CommonUtils.calculateAge(element.dob) > 3;
            })
                .toList()
                .length >
                0) {
              isRedirect = false;
            }
          }
        }

        if (!isRedirect) {
          CommonUtils.showToast("The child's age should not be more than 3 years.");
        } else {
          for (Room room in rooms) {
            if (room.children != null && room.children!.length > 2) {
              isRedirect = false;
              break;
            }
          }

          if (!isRedirect) {
            CommonUtils.showToast("1 room has max 2 children");
          }
        }
      }
    }


    return isRedirect;
  }
}
