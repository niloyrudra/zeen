// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget notificationView(BuildContext context, String? title, Widget? widget) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title!,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
      ),
      widget!,
    ],
  );
}
