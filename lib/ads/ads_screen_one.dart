import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/ads/ads_screen_two.dart';
import 'package:zeen/config/images.dart';
// import 'package:zeen/config/text_style.dart';

class AdsOneScreen extends StatefulWidget {
  const AdsOneScreen({Key? key}) : super(key: key);

  @override
  State<AdsOneScreen> createState() => _AdsOneScreenState();
}

class _AdsOneScreenState extends State<AdsOneScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer( const Duration(seconds: 3), () {
      Get.to(() => const AdsTwoScreen() );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: Get.height,
        // width: Get.width,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(DefaultImages.ads1),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
