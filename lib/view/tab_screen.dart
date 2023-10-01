import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/home_controller.dart';
import 'package:zeen/controller/tab_screen_controller.dart';
import 'package:zeen/view/card/card_screen.dart';
import 'package:zeen/view/home/home_screen.dart';
import 'package:zeen/view/profile/profile_screen.dart';
import 'package:zeen/view/statistics/statistics_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor(AppTheme.primaryColorString!),
        onPressed: () {},
        child: SvgPicture.asset(
          DefaultImages.scan,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        currentIndex: tabController.pageIndex.value,
        onTap: (index) {
          setState(() {
            tabController.pageIndex.value = index;
          });
        },
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : Theme.of(context).appBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppTheme.isLightTheme == false
            ? const Color(0xffA2A0A8)
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.4),
        selectedItemColor: HexColor(AppTheme.primaryColorString!),
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                DefaultImages.home,
                color: tabController.pageIndex.value == 0
                    ? HexColor(AppTheme.primaryColorString!)
                    : AppTheme.isLightTheme == false
                    ? const Color(0xffA2A0A8)
                    : HexColor(AppTheme.primaryColorString!)
                    .withOpacity(0.4),
              ),
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset(
                DefaultImages.chart,
                color: tabController.pageIndex.value == 1
                    ? HexColor(AppTheme.primaryColorString!)
                    : AppTheme.isLightTheme == false
                    ? const Color(0xffA2A0A8)
                    : HexColor(AppTheme.primaryColorString!)
                    .withOpacity(0.4),
              ),
            ),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  DefaultImages.card,
                  color: tabController.pageIndex.value == 2
                      ? HexColor(AppTheme.primaryColorString!)
                      : AppTheme.isLightTheme == false
                      ? const Color(0xffA2A0A8)
                      : HexColor(AppTheme.primaryColorString!)
                      .withOpacity(0.4),
                ),
              ),
              label: "Card"),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(
                  DefaultImages.user,
                  color: tabController.pageIndex.value == 3
                      ? HexColor(AppTheme.primaryColorString!)
                      : AppTheme.isLightTheme == false
                      ? const Color(0xffA2A0A8)
                      : HexColor(AppTheme.primaryColorString!)
                      .withOpacity(0.4),
                ),
              ),
              label: "profile"),
        ],
      ),
      body: GetX<TabScreenController>(
        init: tabController,
        builder: (tabController) => tabController.pageIndex.value == 0
            ? HomeScreen(homeController: homeController)
            : tabController.pageIndex.value == 1
              ? const StatisticsScreen()
              : tabController.pageIndex.value == 2
                ? const CardScreen()
                : const ProfileScreen(),
      ),
    );
  }
}
