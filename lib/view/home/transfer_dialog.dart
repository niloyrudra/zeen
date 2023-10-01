import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/home/transfer_success_screen.dart';
import 'package:zeen/widgets/custom_container_button.dart';

Widget transferDialog( BuildContext context ) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50),
    child: Container(
      height: 349,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: HexColor(AppTheme.primaryColorString!),
                    size: 20,
                  ),
                ),
                Text(
                  "Confirm",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.transparent,
                    size: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recipient",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffA2A0A8)),
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.08),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transfer to",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffA2A0A8)),
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "**** 9797",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA2A0A8),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.08),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transfer Amount",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xffA2A0A8)),
                ),
                Text(
                  "\$75.00",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.08),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "\$500.00",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomContainerButton(
              title: "Continue",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferSuccessScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    ),
  );
}