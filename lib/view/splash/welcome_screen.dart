import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/tab_screen_controller.dart';
import 'package:zeen/view/login/login_screen.dart';
import 'package:zeen/view/signup/signup_screen.dart';
import 'package:zeen/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final slideController = Get.put( TabScreenController() );
  final controller = PageController( viewportFraction: 0.8, keepPage: true, initialPage: 0 );
  final pages = List<int>.generate( 2, (i) => 1, growable: false );

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      body: Container(
        color: AppTheme.isLightTheme == false
            ? const Color(0xff15141F)
            : const Color(0xffFFFFFF),
        child: Padding(
          padding: EdgeInsets.only(
            left: 32,
            right: 32.0,
            top: AppBar().preferredSize.height,
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    slideController.i.value == 0
                        ? "Welcome to Zeen"
                        : "Budgeting",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodySmall!.color
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(const LoginScreen());
                    },
                    child: Container(
                      height: 34,
                        width: 62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppTheme.isLightTheme == false
                          ? const Color(0xff52525C)
                            : const Color(0xffF9F9FA),
                      ),
                      child: Center(
                        child: Text(
                          "Skip",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppTheme.isLightTheme == false
                                ? Colors.white
                                : const Color(0xff15141F),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    slideController.i.value == 0
                        ? SizedBox(
                      height: 130,
                      child: Text(
                        "Freely send money across borders.",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                        ),
                      ),
                    )
                        : SizedBox(
                      height: 130,
                      child: Text(
                        "Spend smarter every day, all from one app. ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: pages.length,
                        onPageChanged: (slideIndex) {
                          setState(() {
                            slideController.i.value = slideIndex;
                          });
                        },
                        itemBuilder: (_, index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.transparent,
                              ),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: index == 0
                                  ? SizedBox(
                                  // height: 280,
                                  width: 280, //232,
                                  child: Image.asset(
                                    AppTheme.isLightTheme == false
                                        ? DefaultImages.darkWc1
                                        : DefaultImages.welcomeBanner1, // wc1,
                                    fit: BoxFit.fill,
                                  ))
                                  : SizedBox(
                                  // height: 232,
                                   width: 280,
                                  child: Image.asset(
                                    AppTheme.isLightTheme == false
                                        ? DefaultImages.darkWc2
                                        : DefaultImages.welcomeBanner2, // wc2,
                                    fit: BoxFit.fill,
                                  )));
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: pages.length,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 8,

                          dotWidth: 10,
                          // strokeWidth: 5,
                        ),
                      ),
                    ),
                    //   const SizedBox(height: 30.0),
                  ],
                ),
              ),
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Get.offAll(const LoginScreen());
                },
                child: customButton(HexColor(AppTheme.primaryColorString!),
                    "Login", HexColor(AppTheme.secondaryColorString!), context),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Get.offAll(const SignUpScreen());
                },
                child: customButton(
                    AppTheme.isLightTheme == false
                        ? const Color(0xff52525C)
                        : const Color(0xffF5F7FE),
                    "Create an account",
                    AppTheme.isLightTheme == false
                        ? Colors.white
                        : HexColor(AppTheme.primaryColorString!),
                    context),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
