import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/signup_controlller.dart';
import 'package:zeen/flutterfire.dart';
import 'package:zeen/view/login/login_screen.dart';
import 'package:zeen/view/tab_screen.dart';
import 'package:zeen/widgets/custom_button.dart';
import 'package:zeen/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpController = Get.put(SignUpController());
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    signUpController.isVisible.value = false;
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

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
            color: AppTheme.isLightTheme == false
                ? const Color(0xff15141F)
                : const Color(0xffFFFFFF),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: AppBar().preferredSize.height,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Getting Started",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Create an account to continue!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color(0xffA2A0A8),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            //   const SizedBox(height: 20),
                            CustomTextFormField(
                              focusNode: _focusNodes[0],
                              prefix: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SvgPicture.asset(
                                  DefaultImages.userName,
                                  colorFilter: ColorFilter.mode(
                                      _focusNodes[0].hasFocus
                                          ? HexColor(AppTheme.primaryColorString!)
                                          : const Color(0xffA2A0A8),
                                      BlendMode.srcIn
                                  ),
                                ),
                              ),
                              hintText: "Full Name",
                              inputType: TextInputType.text,
                              textEditingController: signUpController.nameController.value,
                              capitalization: TextCapitalization.words,
                              limit: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z ]'))
                              ],
                            ),

                            const SizedBox(height: 24),

                            CustomTextFormField(
                              focusNode: _focusNodes[1],
                              prefix: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: SvgPicture.asset(
                                  DefaultImages.envelop, //DefaultImages.phone,
                                  colorFilter: ColorFilter.mode(
                                      _focusNodes[1].hasFocus
                                          ? HexColor(AppTheme.primaryColorString!)
                                          : const Color(0xffA2A0A8),
                                      BlendMode.srcIn
                                  ),
                                ),
                              ),
                              hintText: "Email Address",// "Phone Number",
                              inputType: TextInputType.emailAddress, // TextInputType.phone,
                              textEditingController: signUpController.emailController.value,
                              capitalization: TextCapitalization.none,
                              limit: [
                                // LengthLimitingTextInputFormatter(10),
                                // FilteringTextInputFormatter.digitsOnly
                                LengthLimitingTextInputFormatter(30),
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                            ),

                            const SizedBox(height: 24),

                            Obx(() {
                              return CustomTextFormField(
                                focusNode: _focusNodes[2],
                                suffix: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    signUpController.isVisible.value =
                                    !signUpController.isVisible.value;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: SvgPicture.asset(
                                      DefaultImages.eye,
                                      // color:  HexColor(AppTheme.secondaryColorString!)
                                    ),
                                  ),
                                ),
                                prefix: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    DefaultImages.pswd,
                                    colorFilter: ColorFilter.mode(
                                        _focusNodes[2].hasFocus
                                            ? HexColor(AppTheme.primaryColorString!)
                                            : const Color(0xffA2A0A8),
                                        BlendMode.srcIn
                                    ),
                                  ),
                                ),
                                hintText: "Password",
                                obscure:
                                signUpController.isVisible.value == true
                                    ? false
                                    : true,
                                textEditingController:
                                signUpController.passwordController.value,
                                capitalization: TextCapitalization.none,
                                limit: [
                                  FilteringTextInputFormatter
                                      .singleLineFormatter,
                                ],
                                inputType: TextInputType.visiblePassword,
                              );
                            }),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    setState(() {
                                      signUpController.isAgree.value =
                                      !signUpController.isAgree.value;
                                    });
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffDCDBE0)),
                                        color: signUpController.isAgree.value
                                            ? HexColor(
                                            AppTheme.primaryColorString!)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Icon(
                                      Icons.check,
                                      size: 15,
                                      color: signUpController.isAgree.value
                                          ? Colors.white
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                    child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(children: <TextSpan>[
                                        TextSpan(
                                          text:
                                          "By creating an account, you agree to our ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color:
                                            AppTheme.isLightTheme == false
                                                ? const Color(0xffA2A0A8)
                                                : const Color(0xff211F32),
                                          ),
                                        ),
                                        TextSpan(
                                            text: "Terms",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: HexColor(AppTheme
                                                    .primaryColorString!))),
                                        TextSpan(
                                          text: " and ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color:
                                            AppTheme.isLightTheme == false
                                                ? const Color(0xffA2A0A8)
                                                : const Color(0xff211F32),
                                          ),
                                        ),
                                        TextSpan(
                                            text: "Conditions",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: HexColor(AppTheme
                                                    .primaryColorString!))),
                                      ]),
                                    )

                                )
                              ],
                            ),

                            const SizedBox(height: 32),

                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () async {

                                if( signUpController.emailController.value.text == "" || signUpController.nameController.value.text == "" || signUpController.passwordController.value.text == "" ) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please fill out all fields!'))
                                  );
                                }
                                else {

                                  if( signUpController.emailController.value.text.isEmail ) {
                                    String shouldNavigate = await signUp( signUpController.emailController.value.text, signUpController.passwordController.value.text );
                                    if( shouldNavigate == "success"  ) {

                                      Fluttertoast.showToast(
                                          msg: "You signed up successfully!",
                                          toastLength: Toast.LENGTH_LONG, // Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3, // 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );

                                      Get.to(
                                        const TabScreen(), // const CountryResidenceScreen(),
                                        transition: Transition.rightToLeft,
                                        duration: const Duration(milliseconds: 500),
                                      );
                                    }
                                    else {
                                      Fluttertoast.showToast(
                                          msg: shouldNavigate,
                                          toastLength: Toast.LENGTH_LONG, // Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3, // 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                  }
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Please, provide a valid email!'))
                                  );

                                }

                              },
                              child: customButton(
                                  HexColor(AppTheme.primaryColorString!),
                                  "Sign Up",
                                  HexColor(AppTheme.secondaryColorString!),
                                  context
                              ),
                            ),
                            InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Get.to(
                                  const LoginScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already have an account? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color:
                                            const Color(0xff9CA3AF))),
                                    Text(" Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: HexColor(
                                              AppTheme.primaryColorString!),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xffE8E8E8),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16),
                              child: Text("Or Continue with"),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: const Color(0xffE8E8E8),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 56,
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffE8E8E8)),
                            borderRadius: BorderRadius.circular(16),
                            color: HexColor(AppTheme.secondaryColorString!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    DefaultImages.ggl,
                                    //color:  HexColor(AppTheme.secondaryColorString!)
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {},
                                  child: Text(
                                    "Continue with Google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: const Color(0xff15141F),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
