import 'package:flutter/material.dart';
import 'package:mindinventory_practical/models/hotel_model.dart';
import 'package:mindinventory_practical/utils/common_utils.dart';

import '../../utils/common_colors.dart';

class ReportItemView extends StatelessWidget {
  final int index;
  final Room room;

  const ReportItemView({Key? key, this.index = 0, required this.room})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Room ${index + 1}",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: CommonColors.blackColor)),
        const SizedBox(height: 6,),
        ListView.builder(
          padding: const EdgeInsets.only(left: 16),
          itemCount: room.members?.length ?? 0,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            Member member = room.members![index];
            return Row(
              children: [
                Text("Member Name: ${index + 1}",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CommonColors.blackColor)),
                const SizedBox(width: 6,),
                Flexible(
                    child: Text(
                        "${member.firstName} ${member.lastName} - ${CommonUtils.calculateAge(member.dob)}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: CommonColors.blackColor)))
              ],
            );
          },
        ),
        const SizedBox(height: 6,),
        ListView.builder(
          padding: const EdgeInsets.only(left: 16),
          itemCount: room.children?.length ?? 0,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            Member children = room.children![index];
            return Row(
              children: [
                Text("Child Name: ${index + 1}",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CommonColors.blackColor)),
                const SizedBox(width: 6,),
                Flexible(
                    child: Text(
                        "${children.firstName} ${children.lastName} - ${CommonUtils.calculateAge(children.dob)}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: CommonColors.blackColor)))
              ],
            );
          },
        ),
        const SizedBox(height: 6,),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text("Pets: ${room.pets?? 0}",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: CommonColors.blackColor)),
        ),

        const SizedBox(height: 16,),
      ],
    );
  }
}
