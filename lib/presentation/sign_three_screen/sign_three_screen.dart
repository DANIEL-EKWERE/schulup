import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/sign_three_controller.dart';

SignThreeController controller = Get.put(SignThreeController());

// ignore_for_file: must_be_immutable
class SignThreeScreen extends StatefulWidget {
  SignThreeScreen({Key? key}) : super(key: key);

  @override
  State<SignThreeScreen> createState() => _SignThreeScreenState();
}

class _SignThreeScreenState extends State<SignThreeScreen> {
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
                  Text("Schulup Login", style: theme.textTheme.headlineSmall),
                  Text(
                    "Reliable attendance, strengthened security, greater peace of mind.",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumLight.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: controller.usernameController,
                            hintText: "User Name",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            prefix: Container(
                              margin: EdgeInsets.fromLTRB(
                                16.h,
                                18.h,
                                10.h,
                                18.h,
                              ),
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.grey,
                              ),
                              // CustomImageView(
                              //   imagePath: ImageConstant.imgLocation,
                              //   height: 12.h,
                              //   width: 10.h,
                              //   fit: BoxFit.contain,
                              // ),
                            ),
                            prefixConstraints: BoxConstraints(maxHeight: 50.h),
                            // obscureText: true,
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

                          SizedBox(height: 20.h),
                          Obx(
                            () => CustomTextFormField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: controller.passwordController,
                              hintText: "Password",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                margin: EdgeInsets.fromLTRB(
                                  16.h,
                                  18.h,
                                  10.h,
                                  18.h,
                                ),
                                child: Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.grey,
                                ),
                                // CustomImageView(
                                //   imagePath: ImageConstant.imgGroup10,
                                //   height: 12.h,
                                //   width: 10.h,
                                //   fit: BoxFit.contain,
                                // ),
                              ),
                              prefixConstraints: BoxConstraints(
                                maxHeight: 50.h,
                              ),
                              suffix: InkWell(
                                onTap: () {
                                  controller.isShowPassword.value =
                                      !controller.isShowPassword.value;
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 16.h,
                                    vertical: 18.h,
                                  ),
                                  child:
                                      controller.isShowPassword.value
                                          ? Icon(
                                            Icons.remove_red_eye_outlined,
                                            color: Colors.grey,
                                          )
                                          : Icon(
                                            Icons.visibility_off_outlined,
                                            color: Colors.grey,
                                          ),
                                ),
                              ),
                              suffixConstraints: BoxConstraints(
                                maxHeight: 50.h,
                              ),
                              obscureText: controller.isShowPassword.value,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 12.h,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(
                                      value,
                                      isRequired: true,
                                    ))) {
                                  return "err_msg_please_enter_valid_password"
                                      .tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: controller.schoolCodeController,
                            hintText: "School Code",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            prefix: Container(
                              margin: EdgeInsets.fromLTRB(
                                16.h,
                                18.h,
                                10.h,
                                18.h,
                              ),
                              child: Icon(
                                Icons.school_outlined,
                                color: Colors.grey,
                              ),
                              // CustomImageView(
                              //   imagePath: ImageConstant.imgLocation,
                              //   height: 12.h,
                              //   width: 10.h,
                              //   fit: BoxFit.contain,
                              // ),
                            ),
                            prefixConstraints: BoxConstraints(maxHeight: 50.h),
                            //obscureText: true,
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
                          //           controller.eyecrossedoneController.text.isEmpty
                          // ? CustomOutlinedButton(
                          //   text: "lbl_log_in".tr,
                          //   buttonStyle: CustomButtonStyles.outlineGray,
                          //   buttonTextStyle: CustomTextStyles.titleSmallPrimaryContainer,
                          // )
                          // : CustomOutlinedButton(
                          //   onPressed: () {
                          //     print(controller.eyecrossedoneController.text);
                          //   },
                          //   text: "lbl_log_in".tr,
                          //   buttonStyle: CustomButtonStyles.outlineGrayTL8,
                          //   buttonTextStyle: CustomTextStyles.titleSmallGray50,
                          // ),
                          (controller.usernameController.text.isEmpty ||
                                  controller.passwordController.text.isEmpty ||
                                  controller.schoolCodeController.text.isEmpty)
                              ? CustomOutlinedButton(
                                text: "lbl_log_in".tr,
                                buttonStyle: CustomButtonStyles.outlineGray,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallPrimaryContainer,
                              )
                              : CustomOutlinedButton(
                                onPressed: () {
                                  print(controller.usernameController.text);
                                  print(controller.passwordController.text);
                                  print(controller.schoolCodeController.text);
                                  controller.firstLogin();
                                },
                                text: "lbl_log_in".tr,
                                buttonStyle: CustomButtonStyles.outlineGrayTL8,
                                buttonTextStyle:
                                    CustomTextStyles.titleSmallGray50,
                              ),
                          SizedBox(height: 80.h),
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
