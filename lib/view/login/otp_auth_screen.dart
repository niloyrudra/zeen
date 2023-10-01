// ignore_for_file: deprecated_member_use

import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/login/fingerprint_screen.dart';
import 'package:zeen/widgets/custom_button.dart';
// import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpAuthenticationScreen extends StatefulWidget {
  const OtpAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<OtpAuthenticationScreen> createState() => _OtpAuthenticationScreenState();
}

class _OtpAuthenticationScreenState extends State<OtpAuthenticationScreen> {
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

  // Email OTP
  // EmailOTP _emailOTPAuth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppTheme.isLightTheme == false ? const Color(0xff15141F) : const Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: AppBar().preferredSize.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
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
                          "OTP Authentication",
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "An authentication code has been sent to",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color(0xffA2A0A8),
                              ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          Get.arguments['userEmail'] ?? 'xxx@xxx.xxx',// "(+62) 812 345 6XXX",
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
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () async {
                            // if (await _emailOTPAuth.verifyOTP(otp: defaultPinTheme.hashCode) == true) {
                            //   print("OTP is verified");
                              Get.to(
                                const FingerPrintScreen(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                              );

                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(const SnackBar(
                              // content: Text("OTP is verified"),
                              // ));
                            // } else {
                            //   print("Invalid OTP");
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(const SnackBar(
                              // content: Text("Invalid OTP"),
                              // ));
                            // }

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
