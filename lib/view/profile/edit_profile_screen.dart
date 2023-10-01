// ignore_for_file: deprecated_member_use

import 'package:zeen/config/images.dart';
import 'package:zeen/config/text_style.dart';
import 'package:zeen/widgets/custom_container_button.dart';
import 'package:zeen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.isLightTheme == false
            ? HexColor('#15141f')
            : HexColor(AppTheme.primaryColorString!).withOpacity(0.05),
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
        title: Text(
          "My Account",
          style: Theme.of(context).textTheme.headline6!.copyWith(
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
            child: ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: AppTheme.isLightTheme == false
                                ? const Color(0xffF5F7FE)
                                : HexColor(AppTheme.primaryColorString!)
                                    .withOpacity(0.05),
                            foregroundImage: const AssetImage(
                              DefaultImages.profile,
                            ),
                          ),
                          SizedBox(
                            height: 28,
                            width: 28,
                            child: SvgPicture.asset(
                              DefaultImages.camera,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      CustomTextField(
                        hintText: "Enter userName",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.profileUser,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "Daniel Travis"),
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Enter mobile number",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.call,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "0812 345 6789"),
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Enter password",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.lock,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "1234567"),
                        isObsecure: true,
                        suffix: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.invisible,
                          ),
                        ),
                        inputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        hintText: "Enter bank",
                        widget: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            DefaultImages.flag,
                          ),
                        ),
                        color: AppTheme.isLightTheme == false
                            ? const Color(0xff211F32)
                            : const Color(0xffF9F9FA),
                        radius: 16,
                        textEditingController:
                            TextEditingController(text: "Indonesian"),
                        suffix: Padding(
                          padding: const EdgeInsets.only(top: 16, right: 15),
                          child: Text(
                            "Change",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: HexColor(AppTheme.primaryColorString!),
                                ),
                          ),
                        ),
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).padding.bottom + 14,
            ),
            child: CustomContainerButton(
              title: "Save changes",
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
