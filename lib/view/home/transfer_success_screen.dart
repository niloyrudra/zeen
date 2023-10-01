import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/home/transaction_history_screen.dart';

class TransferSuccessScreen extends StatefulWidget {
  const TransferSuccessScreen({Key? key}) : super(key: key);

  @override
  State<TransferSuccessScreen> createState() => _TransferSuccessScreenState();
}

class _TransferSuccessScreenState extends State<TransferSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? const Color(0xff15141F)
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
          "Transfer Success",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppTheme.isLightTheme == false
              ? const Color(0xff15141F)
              : Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      color: AppTheme.isLightTheme == false
                          ? const Color(0xff15141F)
                          : HexColor(AppTheme.primaryColorString!)
                          .withOpacity(0.05),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 10, right: 10, top: 50),
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppTheme.isLightTheme == false
                              ? const Color(0xff323045)
                              : Theme.of(context).canvasColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 80),
                              Text(
                                "#TR-109092021",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffA2A0A8),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, right: 5),
                                    child: Text(
                                      "\$",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "75.00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontSize: 48,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Recipient",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffA2A0A8)),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 24,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              DefaultImages.user1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        "Philip",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color!
                                    .withOpacity(0.08),
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transfer to",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffA2A0A8)),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        DefaultImages.creditCard1,
                                        height: 24,
                                        width: 24,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Wise",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "**** 9797",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xffA2A0A8),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color!
                                    .withOpacity(0.08),
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Transfer Amount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffA2A0A8)),
                                  ),
                                  Text(
                                    "\$75.00",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color!
                                    .withOpacity(0.08),
                              ),
                              const Expanded(child: SizedBox()),
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Get.to(const TransactionHistoryScreen(),
                                      transition: Transition.downToUp,
                                      duration:
                                      const Duration(milliseconds: 500));
                                },
                                child: Text(
                                  "History Transactions",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.isLightTheme == false
                                        ? Colors.white
                                        : HexColor(
                                        AppTheme.primaryColorString!),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.isLightTheme == false
                          ? HexColor('#15141f')
                          : Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Container(
                              height: 56,
                              width: (Get.width / 2) - 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppTheme.isLightTheme == false
                                    ? Colors.black
                                    : HexColor(AppTheme.primaryColorString!)
                                    .withOpacity(0.05),
                              ),
                              child: Center(
                                child: Text(
                                  "Print",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.isLightTheme == false
                                        ? Colors.white
                                        : HexColor(
                                        AppTheme.primaryColorString!),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 56,
                              width: (Get.width / 2) - 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: HexColor(AppTheme.primaryColorString!),
                              ),
                              child: Center(
                                child: Text(
                                  "Done",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 104,
              width: 152,
              child: SvgPicture.asset(
                DefaultImages.transferSuccess,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
