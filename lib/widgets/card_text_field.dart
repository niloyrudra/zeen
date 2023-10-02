import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/text_style.dart';

class CardTextField extends StatelessWidget {
  final String? hintText;
  final double? radius;
  final Color? color;
  final TextEditingController? textEditingController;
  final bool isObsecure;
  final Widget? suffix;
  final TextInputType? inputType;
  const CardTextField({
    Key? key,
    this.hintText,
    this.radius,
    this.color,
    this.textEditingController,
    this.isObsecure = false,
    this.suffix,
    this.inputType,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: Get.width,
      decoration: BoxDecoration(
          color: color!, borderRadius: BorderRadius.circular(radius!)),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: isObsecure,
        controller: textEditingController,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 16),
          border: InputBorder.none,
          suffixIcon: suffix ?? const SizedBox(),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: HexColor('#A2A0A8'),
          ),
        ),
      ),
    );
  }
}
