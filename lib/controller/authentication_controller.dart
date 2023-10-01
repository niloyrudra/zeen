import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  // Recovery password
  Rx<TextEditingController> passwordRecoveryController =
      TextEditingController().obs;

  // Reset password
  Rx<TextEditingController> newPasswordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;
  RxBool isNewVisible = false.obs;
  RxBool isConfirmVisible = false.obs;
}