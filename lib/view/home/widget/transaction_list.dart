import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';

Widget transactionList(String? image, Color? background, String? title,
    String? subTitle, String? price, String? time) {
  return ListTile(
    leading: image != ""
        ? SvgPicture.asset(
      image!,
      height: 40,
      width: 40,
    )
        : Image.asset(
      DefaultImages.transaction2,
      height: 40,
      width: 40,
    ),
    title: Text(
      title!,
      style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
    subtitle: Row(
      children: [
        const Icon(
          Icons.keyboard_backspace_rounded,
          color: Colors.red,
        ),
        const SizedBox(width: 5),
        Text(
          subTitle!,
          style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        price != ""
            ? Text(
          price!,
          style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        )
            : const SizedBox(),
        Text(
          time!,
          style: Theme.of(Get.context!).textTheme.bodySmall!.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}