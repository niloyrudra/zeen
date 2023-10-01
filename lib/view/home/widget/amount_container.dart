import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeen/config/text_style.dart';

Widget amountContainer( BuildContext context, String? amount ) {
  return Container(
    height: 136,
    width: Get.width,
    decoration: BoxDecoration(
      color: AppTheme.isLightTheme == false
          ? const Color(0xff323045)
          : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Amount (USD)",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppTheme.isLightTheme == false
                ? Colors.white
                : HexColor(AppTheme.primaryColorString!).withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.remove,
                  color: HexColor(AppTheme.primaryColorString!),
                  size: 20,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 5),
                    child: Text(
                      "\$",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    amount!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: HexColor(AppTheme.primaryColorString!),
                  size: 20,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}