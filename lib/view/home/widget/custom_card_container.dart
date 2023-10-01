import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/text_style.dart';

Widget customCardContainer({String? title, String? background, Color? textColor}) {
  return Container(
    height: 28,
    decoration: BoxDecoration(
        color: HexColor(background!), borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        title!,
        style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor!,
        ),
      ),
    ),
  );
}