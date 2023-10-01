// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/login/password_reset_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/custom_button.dart';

class VerifyYourIdentityScreen extends StatefulWidget {
  const VerifyYourIdentityScreen({Key? key}) : super(key: key);

  @override
  State<VerifyYourIdentityScreen> createState() => _VerifyYourIdentityScreenState();
}

class _VerifyYourIdentityScreenState extends State<VerifyYourIdentityScreen> {
  final defaultPinTheme = PinTheme(
    width: 66,
    height: 66,
    textStyle: TextStyle(fontSize: 32, color: AppTheme.isLightTheme == false ? Colors.white : const Color(0xff15141F), fontWeight: FontWeight.w800),
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffF9F9FA),
      //border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(16),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : const Color(0xffFFFFFF),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Verify your identity",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "We have just sent a code to",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xffA2A0A8),
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "(+62) 812 345 6XXX",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Pinput(
                          defaultPinTheme: defaultPinTheme,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              const PasswordResetScreen(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 500),
                            );
                          },
                          child: customButton(HexColor(AppTheme.primaryColorString!), "Continue", HexColor(AppTheme.secondaryColorString!), context),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
