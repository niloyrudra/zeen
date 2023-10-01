import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/ads/ads_screen_five.dart';

class AdsFourScreen extends StatefulWidget {
  const AdsFourScreen({Key? key}) : super(key: key);

  @override
  State<AdsFourScreen> createState() => _AdsFourScreenState();
}

class _AdsFourScreenState extends State<AdsFourScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer( const Duration(seconds: 3), () {
      Get.to(() => const AdsFiveScreen() );
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
            image: AssetImage(DefaultImages.ads4),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
