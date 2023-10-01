// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget customRow(BuildContext context,String? title) {
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
      const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xffE8E8E8),
        size:25,
      )
    ],
  );
}
