import 'package:flutter/material.dart';
import 'package:zeen/config/text_style.dart';

Widget circleCard(BuildContext context, String? title, Color? color) {
  return Container(
    height: 34,
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == false
          ? const Color(0xff211F32)
          : const Color(0xffF9F9FA),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "•",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppTheme.isLightTheme == false
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
