import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/sign_four_controller.dart';

// ignore_for_file: must_be_immutable
class SignFourScreen extends GetWidget<SignFourController> {
  SignFourScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          height: SizeUtils.height,
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 22.h, top: 76.h, right: 22.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "msg_lorem_ipsum_dolor2".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                  Text(
                    "msg_lorem_ipsum_dolor3".tr,
                    maxLines: null,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumLight.copyWith(
                      height: 2.80,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: controller.passwordoneController,
                            hintText: "lbl_school_id".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            prefix: Container(
                              margin: EdgeInsets.fromLTRB(
                                16.h,
                                18.h,
                                10.h,
                                18.h,
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgLocation,
                                height: 12.h,
                                width: 10.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            prefixConstraints: BoxConstraints(maxHeight: 50.h),
                            obscureText: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 12.h,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password".tr;
                              }
                              return null;
                            },
                          ),
                          Spacer(),
                          CustomOutlinedButton(
                            text: "lbl_log_in".tr,
                            buttonStyle: CustomButtonStyles.outlineGray,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
