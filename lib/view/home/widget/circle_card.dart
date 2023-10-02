import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/text_style.dart';

Widget circleCard({String? image, String? title}) {
  return Column(
    children: [
      Container(
        height: 72,
        width: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : Colors.transparent,
          border: Border.all(
            color: HexColor(AppTheme.primaryColorString!).withOpacity(0.10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                image!,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    AppTheme.isLightTheme == false ? Colors.white : HexColor(AppTheme.primaryColorString!),
                    BlendMode.srcIn
                ),
                // color: AppTheme.isLightTheme == false ? Colors.white : HexColor(AppTheme.primaryColorString!),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        title!,
        style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      )
    ],
  );
}