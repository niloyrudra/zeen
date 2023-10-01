import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/view/splash/welcome_screen.dart';

class AdsFiveScreen extends StatefulWidget {
  const AdsFiveScreen({Key? key}) : super(key: key);

  @override
  State<AdsFiveScreen> createState() => _AdsFiveScreenState();
}

class _AdsFiveScreenState extends State<AdsFiveScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer( const Duration(seconds: 3), () {
      Get.offAll(() => const WelcomeScreen() );
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
            image: AssetImage(DefaultImages.ads5),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
