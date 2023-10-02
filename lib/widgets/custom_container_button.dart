import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/text_style.dart';

class CustomContainerButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const CustomContainerButton({Key? key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 56,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: HexColor(AppTheme.primaryColorString!),
        ),
        child: Center(
          child: Text(
            title!,
            style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
