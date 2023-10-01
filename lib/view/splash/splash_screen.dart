import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zeen/ads/ads_screen_one.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Timer( const Duration(seconds: 3), () {
      //Get.offAll( () => const WelcomeScreen() );
      Get.offAll(() => const AdsOneScreen() );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            color: AppTheme.isLightTheme == false
                ? HexColor('#15141F')
                : HexColor(AppTheme.primaryColorString!)),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 77,// 40,
                  width: 150, // 130,
                  child: Image.asset(DefaultImages.appIcon), // text
                  // child: SvgPicture.asset(DefaultImages.appLogo,
                      // color: HexColor(AppTheme.secondaryColorString!)
                  // ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 48, bottom: 20),
              child: Text(
                "Zeen helps you remit money across borders freely and manage your finance.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xffDCDBE0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
