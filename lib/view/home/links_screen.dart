import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/home/transfer_screen.dart';
import 'package:zeen/view/home/widget/circle_card.dart';
import 'package:zeen/view/home/widget/custom_card_container.dart';

Widget linksScreen( BuildContext context ) {
  return Scaffold(
    body: Container(
      color: AppTheme.isLightTheme == false
          ? const Color(0xff15141F)
          : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning",
                      style: Theme.of(context)
                          .textTheme
                      // .bodyText2!
                          .bodyMedium!
                          .copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .textTheme
                        // .caption!
                            .bodySmall!
                            .color,
                      ),
                    ),
                    Text(
                      "James Lee",
                      style: Theme.of(context)
                          .textTheme
                      // .headline6!
                          .titleLarge!
                          .copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 69,
                      decoration: BoxDecoration(
                        color: const Color(0xffF6A609).withOpacity(0.10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            DefaultImages.ranking,
                          ),
                          Text(
                            "Gold",
                            style:
                            Theme.of(context)
                                .textTheme
                            // .bodyText2!
                                .bodyMedium!
                                .copyWith(
                              color: const Color(0xffF6A609),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        // Get.off(
                        //const ProfileView(),
                        // const TabController(length: 3, vsync: ),
                        // transition: Transition.rightToLeft,
                        // duration: const Duration(milliseconds: 500)
                        // );
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          DefaultImages.avatar,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == false
                              ? HexColor('#15141f')
                              : Theme.of(context).appBarTheme.backgroundColor,
                          border: Border.all(
                            color: HexColor(AppTheme.primaryColorString!)
                                .withOpacity(0.05),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              customCardContainer(
                                title: "USD",
                                background: AppTheme.primaryColorString,
                                textColor: Colors.white,
                              ),
                              const SizedBox(width: 5),
                              customCardContainer(
                                title: "IDR",
                                background: AppTheme.isLightTheme == false
                                    ? '#211F32'
                                    : "#FFFFFF",
                                textColor: Theme.of(context)
                                    .textTheme
                                // .bodyText2!
                                    .bodyMedium!
                                    .color,
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: HexColor(AppTheme.primaryColorString!),
                            size: 20,
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              // Get.to(
                              //     const AddCardScreen(),
                              //     transition: Transition.rightToLeft,
                              //     duration: const Duration(milliseconds: 500)
                              // );
                            },
                            child: Text(
                              "Zeen Links",
                              style: Theme.of(context)
                                  .textTheme
                              // .bodyText2!
                                  .bodyMedium!
                                  .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: HexColor(AppTheme.primaryColorString!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: Get.width/1.73, // 180,
                    width: Get.width,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return SvgPicture.asset(
                          DefaultImages.zeenCardSvg,
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 3,
                      viewportFraction: 1,
                      scale: 0.9,
                      autoplay: true,
                      itemWidth: Get.width,
                      itemHeight: 180,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Analytics!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.analytics,
                        title: "Analytics",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Load Funds!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.mobile,
                        title: "Load Funds",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("History!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.history,
                        title: "History",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Exchange!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.exchange,
                        title: "Exchange",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Pay Bills");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.payBills,
                        title: "Pay Bills",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("QRCode!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.qr,
                        title: "QRCode",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("ZeenSu");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.zeenSu,
                        title: "ZeenSu",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Kyc");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.kyc,
                        title: "KYC",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Get.to(const TransferScreen(),
                            transition: Transition.downToUp,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: circleCard(
                        image: DefaultImages.account,
                        title: "My Account",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Set Goals!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.goal,
                        title: "Set Goals",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Escrow");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.escrow,
                        title: "Escrow",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Cart");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.cart,
                        title: "Receive Pay",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
        ],
      ),
    ),
  );
}