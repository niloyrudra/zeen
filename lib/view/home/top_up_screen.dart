import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/home/top_up_dialog.dart';
import 'package:zeen/view/home/widget/amount_container.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({Key? key}) : super(key: key);

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.isLightTheme == false
          ? HexColor('#15141f')
          : HexColor(AppTheme.primaryColorString!),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Row(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "Top Up",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: Get.height - 107,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppTheme.isLightTheme == false
                        ? const Color(0xff211F32)
                        : Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xffF5F7FE),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: SvgPicture.asset(
                                  DefaultImages.unicorn,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Zeen Card",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "••••   ••••   ••••   5318",
                              style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffA2A0A8),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: amountContainer(context, "500"),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 64,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppTheme.isLightTheme == false
                                      ? const Color(0xff323045)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color:
                                    HexColor(AppTheme.primaryColorString!)
                                        .withOpacity(0.05),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        DefaultImages.mastercard,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        "Debit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        "\$7,124",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: Color(0xffA2A0A8),
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Swipe(
              onSwipeRight: () {
                Get.bottomSheet(
                  topUpDialog(context),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Container(
                  height: 56,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.isLightTheme == false
                        ? HexColor(AppTheme.primaryColorString!)
                        : HexColor(AppTheme.primaryColorString!)
                        .withOpacity(0.05),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppTheme.isLightTheme == false
                                ? Colors.white
                                : HexColor(AppTheme.primaryColorString!),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              DefaultImages.swipe,
                              colorFilter: ColorFilter.mode(
                                  AppTheme.isLightTheme == false
                                      ? HexColor(AppTheme.primaryColorString!)
                                      : Colors.white,
                                  BlendMode.srcIn
                              ),
                              // color: AppTheme.isLightTheme == false
                              //     ? HexColor(AppTheme.primaryColorString!)
                              //     : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "Swipe to top-up",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
