import 'package:flutter/material.dart';

import 'common_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const CommonButton({Key? key, required this.text, this.padding, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: padding ?? const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: CommonColors.primaryColor),
        child: Text("$text",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: CommonColors.whiteColor)),
      ),
    );
  }
}
