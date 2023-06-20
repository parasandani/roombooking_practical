import 'package:flutter/material.dart';
import 'package:mindinventory_practical/view/room_booking/member_child_widget.dart';
import 'package:mindinventory_practical/view/room_booking/room_booking_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../models/hotel_model.dart';
import '../../utils/common_buttons.dart';
import '../../utils/common_colors.dart';
import 'room_item_viewmodel.dart';

class RoomItemView extends StatefulWidget {
  final int index;
  final Room room;
  final VoidCallback onRemoveRoom;

  const RoomItemView(
      {Key? key,
      this.index = 0,
      required this.room,
      required this.onRemoveRoom})
      : super(key: key);

  @override
  State<RoomItemView> createState() => _RoomItemViewState();
}

class _RoomItemViewState extends State<RoomItemView> {
  RoomItemViewModel? mViewModel;
  bool isPetSelected = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel = Provider.of<RoomItemViewModel>(context, listen: false);
      mViewModel!.attachContext(context);
      isPetSelected = widget.room.pets != null && widget.room.pets == 1;
      mViewModel!.notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<RoomItemViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Room ${widget.index + 1}",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CommonColors.blackColor)),
            InkWell(
              onTap: widget.onRemoveRoom,
              child: const Icon(
                Icons.delete,
                color: CommonColors.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        // Pet
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: isPetSelected,
                onChanged: (bool? value) {
                  List<Room> rooms =
                      Provider.of<RoomBookingViewModel>(context, listen: false)
                          .rooms;
                  if (value != null &&
                      value &&
                      rooms
                              .where((element) =>
                                  element.pets == null || element.pets == 0)
                              .toList()
                              .length ==
                          rooms.length) {
                    isPetSelected = value;
                    widget.room.pets = 1;
                  } else {
                    isPetSelected = false;
                    widget.room.pets = 0;
                  }
                  mViewModel!.notifyListeners();
                },
                activeColor: CommonColors.primaryColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text("Do you have Pet? (only 1 allowed)",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CommonColors.blackColor)),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Members",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CommonColors.blackColor)),
            CommonButton(
              text: "Add Member",
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              onTap: () {
                if (widget.room.members == null) {
                  widget.room.members = [];
                }
                widget.room.members!.add(Member());
                mViewModel!.notifyListeners();

                print("${widget.room.members!.length}");
              },
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        // Member
        ListView.builder(
          itemCount: widget.room?.members?.length ?? 0,
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return MemberChildWidget(
              index: index,
              member: widget.room.members![index],
              onRemoveMember: () {
                widget.room.members!.removeAt(index);
                mViewModel!.notifyListeners();
              },
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Children",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CommonColors.blackColor)),
            CommonButton(
              text: "Add Child",
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              onTap: () {
                if (widget.room.children == null) {
                  widget.room.children = [];
                }
                widget.room.children!.add(Member());
                mViewModel!.notifyListeners();

                print("${widget.room.children!.length}");
              },
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        // Member
        ListView.builder(
          itemCount: widget.room?.children?.length ?? 0,
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return MemberChildWidget(
              index: index,
              member: widget.room.children![index],
              onRemoveMember: () {
                widget.room.children!.removeAt(index);
                mViewModel!.notifyListeners();
              },
            );
          },
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
