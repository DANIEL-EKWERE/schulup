import 'package:flutter/material.dart';
import 'package:schoolruns/core/utils/storage.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/sign_two_controller.dart';

SignTwoController controller = Get.put(SignTwoController());

// ignore_for_file: must_be_immutable
class SignTwoScreen extends StatefulWidget {
  SignTwoScreen({Key? key}) : super(key: key);

  @override
  State<SignTwoScreen> createState() => _SignTwoScreenState();
}

class _SignTwoScreenState extends State<SignTwoScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setValues();
  }

  String schoolLogo = '';
  String schoolName = '';

  setValues() async {
    String schoolLogo = await dataBase.getLogo();
    String schoolName = await dataBase.getFullName();
    setState(() {
      this.schoolLogo = schoolLogo;
      this.schoolName = schoolName;
    });
    print(schoolLogo);
    print(schoolName);
  }

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
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 8.h,
                    ),
                    decoration: AppDecoration.outlinePrimaryContainer.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomImageView(
                          imagePath:
                              schoolLogo.isEmpty
                                  ? ImageConstant.imgFloatingIcon
                                  : schoolLogo,
                          height: 42.h,
                          width: 42.h,
                        ),
                        SizedBox(width: 8.h),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Text(
                              // "msg_redemption_academy".tr,
                              schoolName,
                              style:
                                  CustomTextStyles.bodyMediumPrimaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  _buildLoginSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginSection() {
    return Expanded(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            CustomTextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: controller.usernameController,
              hintText: "Username",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              prefix: Container(
                margin: EdgeInsets.fromLTRB(16.h, 18.h, 10.h, 18.h),
                child: Icon(Icons.person_3_outlined, color: Colors.grey),
                // CustomImageView(
                //   imagePath: ImageConstant.imgGroup10,
                //   height: 12.h,
                //   width: 10.h,
                //   fit: BoxFit.contain,
                // ),
              ),
              prefixConstraints: BoxConstraints(maxHeight: 50.h),
              // suffix: InkWell(
              //   onTap: () {
              //     controller.isShowPassword.value =
              //         !controller.isShowPassword.value;
              //   },
              //   child: Container(
              //     margin: EdgeInsets.symmetric(
              //       horizontal: 16.h,
              //       vertical: 18.h,
              //     ),
              //     child:
              //         controller.isShowPassword.value
              //             ? Icon(
              //               Icons.remove_red_eye_outlined,
              //               color: Colors.grey,
              //             )
              //             : Icon(
              //               Icons.visibility_off_outlined,
              //               color: Colors.grey,
              //             ),
              //   ),
              // ),
              suffixConstraints: BoxConstraints(maxHeight: 50.h),
              // obscureText: controller.isShowPassword.value,
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
                  margin: EdgeInsets.fromLTRB(16.h, 18.h, 10.h, 18.h),
                  child: Icon(Icons.lock_outline_rounded, color: Colors.grey),
                  // CustomImageView(
                  //   imagePath: ImageConstant.imgGroup10,
                  //   height: 12.h,
                  //   width: 10.h,
                  //   fit: BoxFit.contain,
                  // ),
                ),
                prefixConstraints: BoxConstraints(maxHeight: 50.h),
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
                suffixConstraints: BoxConstraints(maxHeight: 50.h),
                obscureText: controller.isShowPassword.value,
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
            ),

            Spacer(),

            (controller.passwordController.text.isEmpty ||
                    controller.usernameController.text.isEmpty)
                ? CustomOutlinedButton(
                  text: "lbl_log_in".tr,
                  buttonStyle: CustomButtonStyles.outlineGray,
                  buttonTextStyle: CustomTextStyles.titleSmallPrimaryContainer,
                )
                : CustomOutlinedButton(
                  onPressed: () {
                    print(controller.usernameController.text);
                    print(controller.passwordController.text);
                    controller.secondLogin();
                  },
                  text: "lbl_log_in".tr,
                  buttonStyle: CustomButtonStyles.outlineGrayTL8,
                  buttonTextStyle: CustomTextStyles.titleSmallGray50,
                ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
