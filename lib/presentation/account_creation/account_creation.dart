import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/account_creation_controller.dart'; // ignore_for_file: must_be_immutable

class AccountCreationScreen extends GetWidget<AccountCreationController> {
  const AccountCreationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 202.h),
          child: Column(
            spacing: 14,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup35926,
                height: 108.h,
                width: 110.h,
              ),
              Text("lbl_successful".tr, style: theme.textTheme.displaySmall),
            ],
          ),
        ),
      ),
    );
  }
}
