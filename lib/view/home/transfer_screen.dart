import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:swipe/swipe.dart';
import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/controller/home_controller.dart';
import 'package:zeen/view/home/transfer_dialog.dart';
import 'package:zeen/view/home/widget/amount_container.dart';
import 'package:zeen/widgets/card_text_field.dart';
import 'package:zeen/widgets/custom_container_button.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.isAdd.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.isLightTheme == false ? HexColor('#15141f') : HexColor(AppTheme.primaryColorString!),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      homeController.isAdd.value == false ? "Transfer" : "Transfer Detail",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: Get.height - 87,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            homeController.isAdd.value == false
                                ? Column(
                              children: [
                                Text(
                                  "Where do you want to\ntransfer?",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  height: 56,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppTheme.isLightTheme == false
                                        ? const Color(0xff323045)
                                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                    border: Border.all(
                                      color: HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: SvgPicture.asset(
                                              DefaultImages.card,
                                              fit: BoxFit.fill,
                                              color:
                                              AppTheme.isLightTheme == false ? HexColor('#A2A0A8') : HexColor(AppTheme.primaryColorString!),
                                            )),
                                        const SizedBox(width: 14),
                                        Text(
                                          "Select Bank",
                                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.60)),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 30,
                                          color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Transfer to",
                                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "See all",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: HexColor(AppTheme.primaryColorString!)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 90,
                                  width: Get.width,
                                  child: ListView(
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor: AppTheme.isLightTheme == false
                                                    ? const Color(0xffF5F7FE)
                                                    : HexColor(AppTheme.primaryColorString!).withOpacity(0.15),
                                                child: SvgPicture.asset(
                                                  DefaultImages.userAdd,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "Add",
                                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 14),
                                          for (var index = 0; index < 4; index++)
                                            Padding(
                                              padding: const EdgeInsets.only(left: 14, right: 14),
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: AssetImage(
                                                      index == 0
                                                          ? DefaultImages.user1
                                                          : index == 1
                                                          ? DefaultImages.user2
                                                          : index == 2
                                                          ? DefaultImages.user3
                                                          : DefaultImages.user4,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    index == 0
                                                        ? "Philip"
                                                        : index == 1
                                                        ? "Brandon"
                                                        : index == 2
                                                        ? "Julia"
                                                        : "Dianne",
                                                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                                : Column(
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    DefaultImages.user1,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Phillip",
                                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  height: 64,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppTheme.isLightTheme == false
                                        ? const Color(0xff323045)
                                        : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                    border: Border.all(
                                      color: HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 44,
                                            width: 44,
                                            child: SvgPicture.asset(
                                              DefaultImages.transferDetail,
                                              fit: BoxFit.fill,
                                            )),
                                        const SizedBox(width: 14),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Wise",
                                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "**** 9797",
                                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.60)),
                                            ),
                                          ],
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 30,
                                          color: Theme.of(context).textTheme.titleLarge!.color!.withOpacity(0.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                              ],
                            ),
                            const SizedBox(height: 20),
                            amountContainer(context, "75"),
                            SizedBox(height: homeController.isAdd.value == true ? 20 : 0),
                            homeController.isAdd.value == true
                                ? CardTextField(
                              hintText: "Add Note",
                              color: AppTheme.isLightTheme == false ? const Color(0xff211F32) : const Color(0xffFAFAFA),
                              radius: 12,
                              textEditingController: TextEditingController(),
                            )
                                : const SizedBox(),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          homeController.isAdd.value == false
              ? Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).padding.bottom + 14,
            ),
            child: CustomContainerButton(
              title: "Continue",
              onTap: () {
                setState(() {
                  homeController.isAdd.value = true;
                });
              },
            ),
          )
              : Swipe(
            onSwipeRight: () {
              Get.bottomSheet(
                transferDialog(context),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).padding.bottom + 14,
              ),
              child: Container(
                height: 56,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.isLightTheme == false
                      ? HexColor(AppTheme.primaryColorString!)
                      : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppTheme.isLightTheme == false ? Colors.white : HexColor(AppTheme.primaryColorString!),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            DefaultImages.swipe,
                            color: AppTheme.isLightTheme == false ? HexColor(AppTheme.primaryColorString!) : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "Swipe to transfer",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
