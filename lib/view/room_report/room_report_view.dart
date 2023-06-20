import 'package:flutter/material.dart';
import 'package:mindinventory_practical/view/room_report/report_item_view.dart';

import '../../models/hotel_model.dart';
import '../../utils/common_colors.dart';

class RoomReportView extends StatefulWidget {
  final List<Room> rooms;

  const RoomReportView({Key? key, required this.rooms}) : super(key: key);

  @override
  State<RoomReportView> createState() => _RoomReportViewState();
}

class _RoomReportViewState extends State<RoomReportView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ROoms length: ${widget.rooms.length}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: CommonColors.primaryColor,
        title: const Text("Room Report",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: CommonColors.whiteColor)),
      ),
      body: ListView.builder(
        itemCount: widget.rooms.length,
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ReportItemView(
            index: index,
            room: widget.rooms[index],
          );
        },
      ),
    );
  }
}
