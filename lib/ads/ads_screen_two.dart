import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/ads/ads_screen_three.dart';

class AdsTwoScreen extends StatefulWidget {
  const AdsTwoScreen({Key? key}) : super(key: key);

  @override
  State<AdsTwoScreen> createState() => _AdsTwoScreenState();
}

class _AdsTwoScreenState extends State<AdsTwoScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer( const Duration(seconds: 3), () {
      Get.to(() => const AdsThreeScreen() );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(DefaultImages.ads2),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
