import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/transaction_controller.dart';
import 'package:zeen/view/home/transaction_history_detail_screen.dart';
import 'package:zeen/view/home/widget/transaction_list.dart';
import 'package:zeen/widgets/custom_text_field.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  final transactionController = Get.put(TransactionController());

  @override
  void initState() {
    transactionController.customInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        elevation: 0,
        leading: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
        title: Text(
          "History",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
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
                : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Search",
                  widget: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      DefaultImages.searchNormal,
                    ),
                  ),
                  color: AppTheme.isLightTheme == false
                      ? const Color(0xff211F32)
                      : const Color(0xffFAFAFA),
                  radius: 12,
                  textEditingController: TextEditingController(),
                ),
                const SizedBox(height: 16),
                Container(
                  height: Get.height - 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppTheme.isLightTheme == false
                        ? const Color(0xff211F32)
                        : const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 16, right: 16),
                              child: Text(
                                "Today",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff9CA3AF),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                for (var i = 0;
                                i <
                                    transactionController
                                        .transactionList.length;
                                i++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: InkWell(
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Get.to(
                                          TransactionHistoryDetailScreen(
                                            transactionList:
                                            transactionController
                                                .transactionList[i],
                                          ),
                                          transition: Transition.downToUp,
                                          duration: const Duration(
                                            milliseconds: 500,
                                          ),
                                        );
                                      },
                                      child: transactionList(
                                        transactionController
                                            .transactionList[i].image,
                                        transactionController
                                            .transactionList[i].background,
                                        transactionController
                                            .transactionList[i].title,
                                        transactionController
                                            .transactionList[i].subTitle,
                                        transactionController
                                            .transactionList[i].price,
                                        transactionController
                                            .transactionList[i].time,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: HexColor(AppTheme.primaryColorString!)
                                      .withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Save more money up to 50% using your",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff52525C),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 36),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Zeen debit card.",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                const Color(0xff52525C),
                                              ),
                                            ),
                                            Text(
                                              " Learn more",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: HexColor(AppTheme
                                                    .primaryColorString!),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 20, bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                    child: Text(
                                      "Last 7 Day",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff9CA3AF),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      for (var i = 0;
                                      i <
                                          transactionController
                                              .transactionList.length;
                                      i++)
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(bottom: 10),
                                          child: transactionList(
                                            transactionController
                                                .transactionList[i].image,
                                            transactionController
                                                .transactionList[i].background,
                                            transactionController
                                                .transactionList[i].title,
                                            transactionController
                                                .transactionList[i].subTitle,
                                            transactionController
                                                .transactionList[i].price,
                                            transactionController
                                                .transactionList[i].time,
                                          ),
                                        )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: HexColor(AppTheme.primaryColorString!),
              child: SvgPicture.asset(
                DefaultImages.sort,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
