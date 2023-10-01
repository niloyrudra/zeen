// ignore_for_file: deprecated_member_use

import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/profile_controller.dart';
import 'package:zeen/view/profile/widget/notification_view.dart';
import 'package:zeen/widgets/custom_container_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: AppTheme.isLightTheme == false
                ? HexColor('#15141f')
                : Theme.of(context).appBarTheme.backgroundColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    const SizedBox(height: 32),
                    notificationView(
                      context,
                      "Fee alert",
                      CupertinoSwitch(
                        value: profileController.alert.value,
                        activeColor: HexColor(AppTheme.primaryColorString!),
                        onChanged: (v) {
                          setState(() {
                            profileController.alert.value = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    notificationView(
                      context,
                      "Big expense alert",
                      CupertinoSwitch(
                        value: profileController.expense.value,
                        activeColor: HexColor(AppTheme.primaryColorString!),
                        onChanged: (v) {
                          setState(() {
                            profileController.expense.value = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    notificationView(
                      context,
                      "Credit utilization alert",
                      CupertinoSwitch(
                        value: profileController.utilize.value,
                        activeColor: HexColor(AppTheme.primaryColorString!),
                        onChanged: (v) {
                          setState(() {
                            profileController.alert.value = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    notificationView(
                      context,
                      "Low balance alert",
                      CupertinoSwitch(
                        value: profileController.balance.value,
                        activeColor: HexColor(AppTheme.primaryColorString!),
                        onChanged: (v) {
                          setState(() {
                            profileController.balance.value = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    notificationView(
                      context,
                      "Recurring paid alert",
                      CupertinoSwitch(
                        value: profileController.paid.value,
                        activeColor: HexColor(AppTheme.primaryColorString!),
                        onChanged: (v) {
                          setState(() {
                            profileController.paid.value = v;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    notificationView(
                      context,
                      "Spending update",
                      CupertinoSwitch(
                        value: profileController.spending.value,
                        activeColor: HexColor(AppTheme.primaryColorString!),
                        onChanged: (v) {
                          setState(() {
                            profileController.spending.value = v;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: CustomContainerButton(
              title: "Save Changes",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
