import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_appbar.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_switch.dart';
import 'controller/sign_five_controller.dart'; // ignore_for_file: must_be_immutable

class SignFiveScreen extends GetWidget<SignFiveController> {
  const SignFiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppBar(),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 22.h, top: 12.h, right: 22.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "msg_account_settings".tr,
                style: CustomTextStyles.bodyMediumPrimary,
              ),
              SizedBox(height: 6.h),
              Obx(
                () => CustomOutlinedButton(
                  width: double.infinity,
                  height: 62.h,
                  text: controller.name.value,
                  margin: EdgeInsets.symmetric(horizontal: 28.h),
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 10.h),
                    child: CustomImageView(
                      //imagePath: ImageConstant.imgFloatingIcon,
                      imagePath:
                          controller.logo.value.isNotEmpty
                              ? controller.logo.value
                              : ImageConstant.imgSchulupLogo,
                      height: 42.h,
                      width: 42.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  buttonStyle: CustomButtonStyles.outlinePrimaryContainer,
                  buttonTextStyle: CustomTextStyles.bodyMediumPrimaryContainer,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "msg_change_school_id".tr,
                style: CustomTextStyles.bodySmallIndigoA700Light,
              ),
              SizedBox(height: 36.h),
              _buildNotificationSettings(),
              SizedBox(height: 40.h),
              _buildLanguagePreferences(),
              SizedBox(height: 38.h),
              _buildSupportAndFeedback(),
              SizedBox(height: 62.h),
              SizedBox(
                width: 94.h,
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppRoutes.signTwoScreen);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Are you sure you want to logout?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                controller.logout();
                              },
                              child: Text("Logout"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowDown,
                        height: 24.h,
                        width: 24.h,
                      ),
                      SizedBox(width: 10.h),
                      Text(
                        "lbl_logout".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallPoppinsGray800
                            .copyWith(height: 1.20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 41.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 33.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      title: AppbarTitle(
        text: "lbl_settings".tr,
        margin: EdgeInsets.only(left: 17.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationSettings() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_notification_settings".tr,
            style: CustomTextStyles.bodyMediumPrimary,
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "msg_email_notification".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Obx(
                  () => CustomSwitch(
                    value: controller.isSelectedSwitch.value,
                    onChange: (value) {
                      controller.isSelectedSwitch.value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "msg_sms_notification".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Obx(
                  () => CustomSwitch(
                    value: controller.isSelectedSwitch1.value,
                    onChange: (value) {
                      controller.isSelectedSwitch1.value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLanguagePreferences() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_language_preferences".tr,
            style: CustomTextStyles.bodyMediumPrimary,
          ),
          SizedBox(
            width: double.maxFinite,
            child: _buildContactSupport(contactsupport: "lbl_language".tr),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSupportAndFeedback() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_support_and_feedback".tr,
            style: CustomTextStyles.bodyMediumPrimary,
          ),
          SizedBox(
            width: double.maxFinite,
            child: _buildContactSupport(
              contactsupport: "lbl_contact_support".tr,
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: _buildContactSupport(contactsupport: "lbl_send_feedback".tr),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildContactSupport({required String contactsupport}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            contactsupport,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 16.h,
          width: 10.h,
          margin: EdgeInsets.only(top: 2.h),
        ),
      ],
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
