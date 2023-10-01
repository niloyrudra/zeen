// ignore_for_file: deprecated_member_use

import 'package:zeen/config/text_style.dart';
import 'package:flutter/material.dart';

Widget customReasonContainer(
    BuildContext context, String text, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 56,
      decoration: BoxDecoration(
          color: AppTheme.isLightTheme == false
              ? const Color(0xff211F32)
              : const Color(0xffF9F9FA),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppTheme.isLightTheme == false
                        ? Colors.white
                        : const Color(0xff15141F),
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 15,
              color: Color(0xffA2A0A8),
            ),
          )
        ],
      ),
    ),
  );
}
