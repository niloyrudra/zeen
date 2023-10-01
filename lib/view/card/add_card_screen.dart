import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/view/card/create_pin_screen.dart';
import 'package:zeen/widgets/card_text_field.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
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
          "Add card",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardTextField(
                          hintText: "Enter name",
                          color: AppTheme.isLightTheme == false
                              ? const Color(0xff323045)
                              : const Color(0xffF9F9FA),
                          radius: 16,
                          inputType: TextInputType.name,
                        ),
                        const SizedBox(height: 24),
                        CardTextField(
                          hintText: "Enter number",
                          color: AppTheme.isLightTheme == false
                              ? const Color(0xff323045)
                              : const Color(0xffF9F9FA),
                          radius: 16,
                          suffix: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(DefaultImages.mastercard),
                          ),
                          inputType: TextInputType.number,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: CardTextField(
                                hintText: "MM/yy",
                                color: AppTheme.isLightTheme == false
                                    ? const Color(0xff323045)
                                    : const Color(0xffF9F9FA),
                                radius: 16,
                                inputType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 17),
                            Expanded(
                              child: CardTextField(
                                hintText: "3-digit CVV",
                                color: AppTheme.isLightTheme == false
                                    ? const Color(0xff323045)
                                    : const Color(0xffF9F9FA),
                                radius: 16,
                                inputType: TextInputType.number,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Get.to(
                  const CreatePinScreen(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20,
                    bottom: MediaQuery.of(context).padding.bottom + 14,
                    left: 20,
                    right: 20),
                child: Container(
                  height: 64,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor(AppTheme.primaryColorString!),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(DefaultImages.scan),
                        const SizedBox(width: 14),
                        Text(
                          "Scan your card",
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
