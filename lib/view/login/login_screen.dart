import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
// import 'package:zeen/controller/home_controller.dart';
import 'package:zeen/controller/login_controller.dart';
import 'package:zeen/flutterfire.dart';
// import 'package:zeen/view/home/home_screen.dart';
import 'package:zeen/view/login/password_recovery_screen.dart';
import 'package:zeen/view/signup/signup_screen.dart';
import 'package:zeen/view/tab_screen.dart';
import 'package:zeen/widgets/custom_button.dart';
import 'package:zeen/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode()
  ];

  @override
  void initState() {
    loginController.isVisible.value = false;
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
                    // const Icon(Icons.arrow_back),
                    const SizedBox(
                      height: 38,
                    ),
                    Text(
                      "Hi Welcome Back!",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Sign in to your account",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xffA2A0A8),
                      ),
                    ),

                    Expanded(
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 30),
                              Obx(() {
                                return CustomTextFormField(
                                  focusNode: _focusNodes[0],
                                  prefix: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: SvgPicture.asset(
                                      DefaultImages.envelop, // DefaultImages.phone,
                                      color: _focusNodes[0].hasFocus
                                          ? HexColor(AppTheme.primaryColorString!)
                                          : const Color(0xffA2A0A8),
                                      // color:  HexColor(AppTheme.secondaryColorString!)
                                    ),
                                  ),
                                  hintText: "Email Address", // "Phone Number",
                                  inputType: TextInputType.emailAddress, // TextInputType.phone,
                                  textEditingController: loginController.emailController.value,
                                  capitalization: TextCapitalization.none,
                                  limit: [
                                    // LengthLimitingTextInputFormatter(10),
                                    // FilteringTextInputFormatter.digitsOnly
                                    LengthLimitingTextInputFormatter(30),
                                    FilteringTextInputFormatter.singleLineFormatter
                                  ],
                                );
                              }),
                              const SizedBox(height: 24),
                              Obx(() {
                                return CustomTextFormField(
                                  focusNode: _focusNodes[1],
                                  suffix: InkWell(
                                    focusColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      loginController.isVisible.value =
                                      !loginController.isVisible.value;
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
                                      color: _focusNodes[1].hasFocus
                                          ? HexColor(AppTheme.primaryColorString!)
                                          : const Color(0xffA2A0A8),
                                      // color:  HexColor(AppTheme.secondaryColorString!)
                                    ),
                                  ),
                                  hintText: "Password",
                                  obscure: loginController.isVisible.value == true
                                      ? false
                                      : true,
                                  textEditingController:
                                  loginController.passwordController.value,
                                  capitalization: TextCapitalization.none,
                                  limit: [
                                    FilteringTextInputFormatter
                                        .singleLineFormatter,
                                  ],
                                  inputType: TextInputType.visiblePassword,
                                );
                              }),
                              const SizedBox(height: 16),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Get.to(
                                    const PasswordRecoveryScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Forgot your password?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: HexColor(
                                            AppTheme.primaryColorString!),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () async {
                                  String email = loginController.emailController.value.text;

                                  bool shouldNavigate = await signIn( email, loginController.passwordController.value.text);
                                  if( shouldNavigate ) {
                                    Get.to(
                                      const TabScreen(),
                                      transition: Transition.rightToLeft,
                                      duration: const Duration(milliseconds: 500),
                                    );
                                    // Get.offAll(
                                    // Get.to(
                                    //   HomeScreen(homeController: HomeController()),
                                    //   arguments: {
                                    //       'userEmail': email
                                    //   },
                                    //   transition: Transition.rightToLeft,
                                    //   duration: const Duration(milliseconds: 500),
                                    // );
                                    // Get.to(
                                    //   const OtpAuthenticationScreen(),
                                    //   arguments: {
                                    //     'userEmail': email
                                    //   },
                                    //   transition: Transition.rightToLeft,
                                    //   duration: const Duration(milliseconds: 500),
                                    // );
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => const OtpAuthenticationScreen(),
                                    //     settings: RouteSettings(
                                    //       arguments: loginController.emailController.value.text
                                    //   )
                                    //                                   // );   )
                                    //
                                  }

                                },
                                child: customButton(
                                    HexColor(AppTheme.primaryColorString!),
                                    "Login",
                                    HexColor(AppTheme.secondaryColorString!),
                                    context),
                              ),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Get.to(
                                    const SignUpScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don’t have account?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color:
                                              const Color(0xff9CA3AF))),
                                      Text(" Sign Up",
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
                                child: Text("Or login with"),
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
                                    onTap: () async {
                                      // await signInWithGoogle();
                                      // Object res = signInWithGoogle();
                                      if( kDebugMode ) {
                                        print("Login With Google");
                                      }
                                    },
                                    child: Text(
                                      "Login with Google",
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
        )
    );
  }
}
