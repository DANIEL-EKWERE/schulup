import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schoolruns/presentation/iphone1415proeightyonescreen/controller/iphone1415proeightyonecontroller.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';

import '../../widgets/app_bar/custom_appbar.dart';
import '../../widgets/custom_outlined_button.dart';

class Iphone1415ProEightyoneScreen
    extends GetWidget<Iphone1415ProEightyoneController> {
  const Iphone1415ProEightyoneScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppBar(),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 54.h),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                decoration: AppDecoration.outlinePrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Column(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildPickupInfo(),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgLock,
                            height: 40.h,
                            width: 42.h,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_name".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodySmallGray50010,
                                ),
                                Text(
                                  "msg_jonathan_okuneva".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_relationship".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodySmallGray500
                                      .copyWith(height: 1.17),
                                ),
                                Text(
                                  "lbl_parent".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    height: 1.17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: VerticalDivider(width: 1.h, thickness: 1.h),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgContrast,
                            height: 12.h,
                            width: 12.h,
                            margin: EdgeInsets.only(left: 8.h),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.h),
                            child: Text(
                              "lbl_student".tr,
                              style: theme.textTheme.bodySmall,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                VerticalDivider(width: 1.h, thickness: 1.h),
                                Container(
                                  width: 76.h,
                                  margin: EdgeInsets.only(left: 8.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "lbl_date".tr,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles.bodySmallGray500
                                            .copyWith(height: 1.17),
                                      ),
                                      Text(
                                        "lbl_4th_july_2024".tr,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(height: 1.17),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(left: 20.h, right: 32.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 4.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      margin: EdgeInsets.only(right: 6.h),
                                      child: Row(
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgContrast,
                                            height: 10.h,
                                            width: 10.h,
                                          ),
                                          Text(
                                            "lbl_no_of_student".tr,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                CustomTextStyles
                                                    .bodySmallGray500,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "lbl_3".tr,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.bodySmall!
                                          .copyWith(height: 1.30),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: VerticalDivider(
                                    width: 1.h,
                                    thickness: 1.h,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "lbl_departure_time".tr,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodySmallGray500
                                              .copyWith(height: 1.17),
                                        ),
                                        Text(
                                          "lbl_18_45".tr,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(height: 1.17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 78.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalDivider(width: 1.h, thickness: 1.h),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "lbl_arrival_time".tr,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles.bodySmallGray500
                                            .copyWith(height: 1.17),
                                      ),
                                      Text(
                                        "lbl_19_03".tr,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(height: 1.17),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                spacing: 4,
                                children: [
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgLinkedin,
                                          height: 12.h,
                                          width: 8.h,
                                          alignment: Alignment.topCenter,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 6.h),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "lbl_drop_of".tr,
                                                  style:
                                                      CustomTextStyles
                                                          .bodySmallGray500_2,
                                                ),
                                                TextSpan(text: " "),
                                                TextSpan(
                                                  text: "lbl_f".tr,
                                                  style:
                                                      CustomTextStyles
                                                          .bodySmallGray500_2,
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "msg_23_ikot_ekepene".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      height: 1.30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 72.h,
                            margin: EdgeInsets.only(top: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalDivider(width: 1.h, thickness: 1.h),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "lbl_lorem".tr,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles.bodySmallGray500
                                            .copyWith(height: 1.17),
                                      ),
                                      Text(
                                        "lbl_19_03".tr,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(height: 1.17),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 6.h),
                              padding: EdgeInsets.symmetric(horizontal: 18.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: VerticalDivider(
                                      width: 1.h,
                                      thickness: 1.h,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "lbl_ticket_no".tr,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodySmallGray500
                                                .copyWith(height: 1.17),
                                          ),
                                          Text(
                                            "lbl_a6ge6s59".tr,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: theme.textTheme.bodySmall!
                                                .copyWith(height: 1.17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Divider(
                        color: theme.colorScheme.primary.withValues(
                          alpha: 0.44,
                        ),
                        indent: 20.h,
                        endIndent: 20.h,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "lbl_lorem_ipsum2".tr,
                          style: CustomTextStyles.bodySmallExtraLight,
                        ),
                        Text(
                          "lbl_report".tr,
                          style: CustomTextStyles.bodySmallIndigoA700,
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomOutlinedButton(
                    onPressed: () {
                      print('Check In pressed');
                      //controller.checkIn();
                    },
                    width: 134.h,
                    text: "Check In",
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 12.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgVectorWhiteA700,
                        height: 26.h,
                        width: 24.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.h),
                  CustomOutlinedButton(
                    onPressed: () {
                      print('Pick Up pressed');
                    //  controller.checkOut();
                    },
                    width: 134.h,
                    text: "lbl_pickup".tr,
                    leftIcon: Container(
                      margin: EdgeInsets.only(right: 12.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgUserWhiteA700,
                        height: 26.h,
                        width: 24.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 33.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 25.h),
        onTap: () {
          onTapArrowleftone();
        },
      ),
      title: AppbarSubtitle(
        text: "lbl_pickup".tr,
        margin: EdgeInsets.only(left: 17.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildPickupInfo() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: AppDecoration.fillIndigoA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.h),
          Text("lbl_pickup".tr, style: theme.textTheme.titleLarge),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone() {
    Get.back();
  }
}
