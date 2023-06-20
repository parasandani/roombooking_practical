import 'package:flutter/material.dart';
import 'package:mindinventory_practical/utils/common_buttons.dart';
import 'package:mindinventory_practical/view/room_booking/room_booking_viewmodel.dart';
import 'package:mindinventory_practical/view/room_booking/room_item.dart';
import 'package:mindinventory_practical/view/room_report/room_report_view.dart';
import 'package:provider/provider.dart';

import '../../utils/common_colors.dart';

class RoomBookingView extends StatefulWidget {
  const RoomBookingView({Key? key}) : super(key: key);

  @override
  State<RoomBookingView> createState() => _RoomBookingViewState();
}

class _RoomBookingViewState extends State<RoomBookingView> {
  RoomBookingViewModel? mViewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      mViewModel = Provider.of<RoomBookingViewModel>(context, listen: false);
      mViewModel!.attachContext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<RoomBookingViewModel>(context);
    return Scaffold(
      backgroundColor: CommonColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: CommonColors.primaryColor,
        title: const Text("Room Booking",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: CommonColors.whiteColor)),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButton(
                  text: "Add Room",
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    mViewModel!.addRoom();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: mViewModel!.rooms.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return RoomItemView(
                  index: index,
                  room: mViewModel!.rooms[index],
                  onRemoveRoom: () {
                    mViewModel!.removeRoom(index);
                  },
                );
              },
            )),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: CommonButton(
                text: "Submit",
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                onTap: () {
                  if (mViewModel!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RoomReportView(
                              rooms: mViewModel!.rooms,
                            ),));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
