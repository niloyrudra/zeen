import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/model/transaction_model.dart';
import 'package:zeen/view/home/widget/transaction_list.dart';

class TransactionHistoryDetailScreen extends StatefulWidget {
  final TransactionModel transactionList;
  const TransactionHistoryDetailScreen({Key? key, required this.transactionList}) : super(key: key);

  @override
  State<TransactionHistoryDetailScreen> createState() => _TransactionHistoryDetailScreenState();
}

class _TransactionHistoryDetailScreenState extends State<TransactionHistoryDetailScreen> {
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
          "Details",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    //    height: 76,
                    //  color: Colors.white.withOpacity(0.92),
                    child: transactionList(
                      widget.transactionList.image,
                      widget.transactionList.background,
                      widget.transactionList.title,
                      widget.transactionList.subTitle,
                      "",
                      widget.transactionList.time,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .color!
                        .withOpacity(0.05),
                    indent: 70,
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Text(
                      "Amount (USD)",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .color!
                            .withOpacity(0.50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      "- \$120.90",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Divider(
                    thickness: 1,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .color!
                        .withOpacity(0.05),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Payment with",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 72,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppTheme.isLightTheme == false
                          ? const Color(0xff323045)
                          : HexColor(AppTheme.primaryColorString!)
                          .withOpacity(0.05),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 12, bottom: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            DefaultImages.debitCard,
                            fit: BoxFit.fill,
                            height: 48,
                            width: 74,
                          ),
                          const SizedBox(width: 16),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Zeen Card",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "••••   ••••   •••   5318",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xffA2A0A8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "767 Fifth Avenue New York, NY 10153",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffA2A0A8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 172,
                    width: Get.width,
                    child: Image.asset(
                      DefaultImages.map,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
