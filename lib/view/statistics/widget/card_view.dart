import 'package:flutter/material.dart';

Widget cardView(BuildContext context, Color? background, Color? textColor,
    VoidCallback onTap, String? title) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 34,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 25.5, right: 25.5, top: 6, bottom: 4),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    ),
  );
}
