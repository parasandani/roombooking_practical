import 'package:flutter/material.dart';
import 'package:mindinventory_practical/utils/common_textfield.dart';
import 'package:mindinventory_practical/utils/common_utils.dart';

import '../../models/hotel_model.dart';
import '../../utils/common_colors.dart';

class MemberChildWidget extends StatefulWidget {
  int index;
  Member member;
  VoidCallback onRemoveMember;

  MemberChildWidget(
      {Key? key,
      this.index = 0,
      required this.member,
      required this.onRemoveMember})
      : super(key: key);

  @override
  State<MemberChildWidget> createState() => _MemberChildWidgetState();
}

class _MemberChildWidgetState extends State<MemberChildWidget> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      firstNameController.text = widget.member?.firstName ?? "";
      lastNameController.text = widget.member?.lastName ?? "";
      if (widget.member.dob != null) {
        selectedDate = DateTime.parse(widget.member!.dob!);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: CommonColors.grey,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Member ${widget.index + 1}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CommonColors.blackColor)),
              InkWell(
                onTap: widget.onRemoveMember,
                child: const Icon(
                  Icons.delete,
                  color: CommonColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          height: 1,
          color: CommonColors.grey,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: getTextField(
                    title: "First Name",
                    hintText: "Enter first name",
                    controller: firstNameController,
                    onChanged: (String? value) {
                      widget.member.firstName = value ?? "";
                    })),
            const SizedBox(
              width: 12,
            ),
            Flexible(
                flex: 1,
                child: getTextField(
                    title: "Last Name",
                    hintText: "Enter last name",
                    controller: lastNameController,
                    onChanged: (String? value) {
                      widget.member.lastName = value ?? "";
                    })),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        getDatePicker(
            date: CommonUtils.getFormattedDate(selectedDate)?? "",
            onTap: () {
              _selectDate(context);
            }),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          height: 1,
          color: CommonColors.grey,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget getTextField(
      {required String title,
      String? hintText,
      required TextEditingController controller,
      required Function onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CommonColors.blackColor)),
        const SizedBox(
          height: 4,
        ),
        CommonTextField(
          controller: controller,
          hintText: hintText ?? "",
          onChanged: (String? value) {
            onChanged(value);
          },
        )
      ],
    );
  }

  Widget getDatePicker({String? date, required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Date of birth",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CommonColors.blackColor)),
        const SizedBox(
          width: 4,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: date != null
                ? BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: CommonColors.grey),
                  )
                : null,
            child: Row(
              children: [
                Text(date ?? "",
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: CommonColors.blackColor)),
                const Icon(Icons.calendar_today_rounded)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960, 1),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        widget.member.dob = selectedDate.toString();
      });
    }
  }
}
