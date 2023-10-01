import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget socialView(String? image) {
  return SizedBox(
    height: 64,
    width: 64,
    child: SvgPicture.asset(
      image!,
      fit: BoxFit.fill,
    ),
  );
}
