import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/ads/ads_screen_four.dart';

class AdsThreeScreen extends StatefulWidget {
  const AdsThreeScreen({Key? key}) : super(key: key);

  @override
  State<AdsThreeScreen> createState() => _AdsThreeScreenState();
}

class _AdsThreeScreenState extends State<AdsThreeScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer( const Duration(seconds: 3), () {
      Get.to(() => const AdsFourScreen() );
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
            image: AssetImage(DefaultImages.ads3),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
