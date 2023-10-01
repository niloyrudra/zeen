import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.isLightTheme == false
          ? HexColor('#15141f')
          : Colors.transparent,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          //  Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                      ),
                      Text(
                        "My cards",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 260,
                          width: Get.width,
                          child: SvgPicture.asset(
                            DefaultImages.zeenCardSvg, // DefaultImages.fincard,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 27),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            height: 100,
                            width: Get.width,
                            child: Image.asset(
                              AppTheme.isLightTheme == false
                                  ? DefaultImages.cardFrequencyDark
                                  : DefaultImages.cardFrequency,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            // Get.to(
                            //   const AddCardScreen(),
                            //   transition: Transition.downToUp,
                            //   duration: const Duration(milliseconds: 500),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Container(
                              height: 56,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor(AppTheme.primaryColorString!),
                              ),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add card",
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
