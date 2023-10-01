import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/home_controller.dart';
import 'package:zeen/controller/tab_screen_controller.dart';
import 'package:zeen/view/card/add_card_screen.dart';
import 'package:zeen/view/home/links_screen.dart';
import 'package:zeen/view/home/top_up_screen.dart';
import 'package:zeen/view/home/transaction_history_screen.dart';
import 'package:zeen/view/home/transfer_screen.dart';
import 'package:zeen/view/home/widget/circle_card.dart';
import 'package:zeen/view/home/widget/custom_card_container.dart';
import 'package:zeen/view/home/widget/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  final HomeController homeController;
  const HomeScreen({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabController = Get.put(TabScreenController());
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    tabController.customInit();
    homeController.customInit();

    super.initState();
  }

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                    ),
                    Text(
                      "Good morning",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        //     const ProfileView(),
                        //     // const TabController(length: 3, vsync: ),
                        //     transition: Transition.rightToLeft,
                        //     duration: const Duration(milliseconds: 500)
                        // );
                        setState(() {
                          tabController.pageIndex.value = 4;
                        });
                        onTabTapped(4);
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
                              // ToggleSwitch(
                              //   minWidth: 90.0,
                              //   cornerRadius: 10.0,
                              //   activeBgColors: [[Colors.blueAccent[800]!], [Colors.blueAccent[800]!]],
                              //   activeFgColor: Colors.white,
                              //   inactiveBgColor: Colors.grey[250]!,
                              //   inactiveFgColor: Colors.white,
                              //   initialLabelIndex: 1,
                              //   totalSwitches: 2,
                              //   labels: const ['USD', 'IDR'],
                              //   radiusStyle: true,
                              //   onToggle: (index) {
                              //     if (kDebugMode) {
                              //       print('switched to: $index');
                              //     }
                              //   },
                              // ),
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
                              Get.to(
                                  const AddCardScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 500)
                              );
                            },
                            child: Text(
                              "Add Currency",
                              style: Theme.of(context)
                                  .textTheme
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Get.to(const TransferScreen(),
                            transition: Transition.downToUp,
                            duration: const Duration(milliseconds: 500)
                        );
                      },
                      child: circleCard(
                        image: DefaultImages.transfer,
                        title: "Send",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        if( kDebugMode ) {
                          print("Withdraw!");
                        }
                      },
                      child: circleCard(
                        image: DefaultImages.withdraw,
                        title: "Withdraw",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Get.to(const TopUpScreen(),
                            transition: Transition.downToUp,
                            duration: const Duration(milliseconds: 500)
                        );
                      },
                      child: circleCard(
                        image: DefaultImages.topUp,
                        title: "Boost",
                      ),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () async {
                        if( kDebugMode ) {
                          print("MORE SCREEN");
                        }
                        await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 200,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only( left: 16.0, right: 16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // const Text('More Options'),
                                        // ElevatedButton(
                                        //   child: const Text('Close'),
                                        IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Theme.of(context).textTheme.titleLarge!.color, // HexColor(AppTheme.primaryColorString!),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                      ],
                                    ),

                                    const SizedBox( height: 20 ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            if( kDebugMode ) {
                                              print("Blogs!");
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: circleCard(
                                            image: DefaultImages.blog,
                                            title: "Blogs",
                                          ),
                                        ),
                                        const SizedBox( width: 20 ),
                                        InkWell(
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onTap: () {
                                            Navigator.pop(context);
                                            // Get.bottomSheet(
                                            //   linksScreen(context),
                                            // );
                                            Get.to(
                                                linksScreen(context),
                                                // const LinksView(),
                                                transition: Transition.rightToLeft,
                                                duration: const Duration(milliseconds: 500)
                                            );
                                          },
                                          child: circleCard(
                                            image: DefaultImages.link3,
                                            title: "Zeen Links",
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox( height: 20 )

                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: circleCard(
                        image: DefaultImages.more,
                        title: "More",
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme == false
                          ? const Color(0xff211F32)
                          : const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.10),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transactions",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Get.to(
                                      const TransactionHistoryScreen(),
                                      transition: Transition.downToUp,
                                      duration: const Duration(milliseconds: 500)
                                  );
                                },
                                child: Text(
                                  "See All",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: HexColor(
                                          AppTheme.primaryColorString!)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            for (var i = 0;
                            i < homeController.transactionList.length;
                            i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: transactionList(
                                  homeController.transactionList[i].image,
                                  homeController.transactionList[i].background,
                                  homeController.transactionList[i].title,
                                  homeController.transactionList[i].subTitle,
                                  homeController.transactionList[i].price,
                                  homeController.transactionList[i].time,
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
