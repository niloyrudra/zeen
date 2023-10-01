import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/widgets/custom_container_button.dart';

class TopUpSuccessScreen extends StatefulWidget {
  const TopUpSuccessScreen({Key? key}) : super(key: key);

  @override
  State<TopUpSuccessScreen> createState() => _TopUpSuccessScreenState();
}

class _TopUpSuccessScreenState extends State<TopUpSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.isLightTheme == false ? HexColor('#15141f') : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 249,
                    child: SvgPicture.asset(
                      DefaultImages.success,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Top Up Success",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 60,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                    ),
                    child: Center(
                      child: Text(
                        "\$500.00",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Has been added to your Finpay\nCard Balance",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffA2A0A8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).padding.bottom + 14,
              ),
              child: CustomContainerButton(
                title: "Done",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
