import 'package:flutter/material.dart';

import 'common_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function? onChanged;

  const CommonTextField(
      {Key? key, required this.controller, this.hintText = "", this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          focusColor: Colors.transparent,
          contentPadding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          hintText: '$hintText',
          hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: CommonColors.hintColor),
        ),
        onChanged: (String? value){
          if (onChanged != null) {
            onChanged!(value);
          }
        },
      ),
    );
  }
}
