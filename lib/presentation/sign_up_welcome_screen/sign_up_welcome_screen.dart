import 'package:flutter/material.dart';
import 'package:schoolruns/core/utils/storage.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/sign_up_welcome_controller.dart'; // ignore_for_file: must_be_immutable

class SignUpWelcomeScreen extends GetWidget<SignUpWelcomeController> {
  const SignUpWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 150.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Schulup",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.headlineLarge!.copyWith(height: 1.31),
              ),
              SizedBox(height: 4.h),
              Text(
                "msg_lorem_ipsum_dolor".tr,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(
                  height: 1.63,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 46.h),
              CustomElevatedButton(
                onPressed: () async {
                  var token = await dataBase.getToken();
                  print('token: $token');
                  token.isEmpty
                      ?
                      // Get.toNamed('/sign_two_screen');
                      Get.toNamed('/sign_three_screen')
                      : Get.toNamed('/sign_two_screen');
                },
                height: 40.h,
                width: 112.h,
                text: "Continue",
                buttonTextStyle: CustomTextStyles.bodyLargeInterGray100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
