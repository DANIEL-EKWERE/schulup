import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:schoolruns/widgets/app_bar/custom_appbar.dart';
import '../../core/app_export.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title_dropdown.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';

import '../../widgets/custom_outlined_button.dart';
import 'controller/iphone1415proeightytwocontroller.dart';


class Iphone1415ProEightytwoScreen
    extends GetWidget<Iphone1415ProEightytwoController> {
  const Iphone1415ProEightytwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray50,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              height: 792.h,
              child: Stack(
                alignment: Alignment.center,
                children: [_buildVectorone(), _buildHorizontalScroll()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildVectorone() {
    return SizedBox(
      height: 784.h,
      width: 392.h,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          this.controller.googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScroll() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: SizedBox(
            height: 792.h,
            width: 620.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray5001,
                  height: 156.h,
                  width: 146.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 34.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500154x74,
                  height: 54.h,
                  width: 76.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 78.h, bottom: 244.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500154x74,
                  height: 32.h,
                  width: 36.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 48.h, bottom: 230.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500154x74,
                  height: 52.h,
                  width: 62.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(bottom: 200.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500114x10,
                  height: 14.h,
                  width: 12.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 22.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500198x32,
                  height: 98.h,
                  width: 34.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 132.h, right: 12.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500186x120,
                  height: 86.h,
                  width: 122.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 38.h, bottom: 148.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray5001212x224,
                  height: 212.h,
                  width: 226.h,
                  alignment: Alignment.bottomLeft,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray5001170x94,
                  height: 170.h,
                  width: 96.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 6.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500160x56,
                  height: 60.h,
                  width: 58.h,
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 106.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500156x46,
                  height: 56.h,
                  width: 48.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 230.h, bottom: 210.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500130x72,
                  height: 30.h,
                  width: 74.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 164.h, bottom: 282.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray5001174x96,
                  height: 174.h,
                  width: 98.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 268.h, right: 108.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500132x38,
                  height: 32.h,
                  width: 40.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 170.h, bottom: 108.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVectorGray500130x52,
                  height: 30.h,
                  width: 54.h,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 124.h, bottom: 132.h),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgGroup,
                  height: 788.h,
                  width: 394.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgGroupWhiteA700,
                  height: 790.h,
                  width: 394.h,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgArrowRight,
                  height: 66.h,
                  width: 12.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 48.h, right: 182.h),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 130.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 36.h,
                                vertical: 12.h,
                              ),
                              decoration: AppDecoration.row6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 30.h,
                                    margin: EdgeInsets.only(bottom: 96.h),
                                    child: RotationTransition(
                                      turns: AlwaysStoppedAnimation(
                                        -(-20 / 360),
                                      ),
                                      child: Text(
                                        "lbl_street_name".tr,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            CustomTextStyles
                                                .montserratGray60001,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 48.h,
                                      bottom: 4.h,
                                    ),
                                    child: Text(
                                      "lbl_street".tr,
                                      style: theme.textTheme.labelSmall,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 10.h,
                                      margin: EdgeInsets.only(
                                        left: 84.h,
                                        bottom: 258.h,
                                      ),
                                      child: RotationTransition(
                                        turns: AlwaysStoppedAnimation(
                                          -(78 / 360),
                                        ),
                                        child: Text(
                                          "lbl_street_name".tr,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              CustomTextStyles
                                                  .montserratGray60001,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 16.h,
                                    margin: EdgeInsets.only(
                                      left: 36.h,
                                      bottom: 88.h,
                                    ),
                                    child: RotationTransition(
                                      turns: AlwaysStoppedAnimation(
                                        -(64 / 360),
                                      ),
                                      child: Text(
                                        "lbl_street_name".tr,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            CustomTextStyles
                                                .montserratGray60001,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 54.h,
                                        top: 82.h,
                                      ),
                                      child: Text(
                                        "lbl_lowervailsburg".tr,
                                        style: theme.textTheme.labelSmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 224.h, top: 92.h),
                    child: Text(
                      "lbl_union".tr,
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 18.h,
                    margin: EdgeInsets.only(bottom: 216.h),
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-(64 / 360)),
                      child: Text(
                        "lbl_street_name".tr,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.montserratGray60001,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 26.h,
                    margin: EdgeInsets.only(left: 156.h, top: 114.h),
                    child: RotationTransition(
                      turns: AlwaysStoppedAnimation(-(-41 / 360)),
                      child: Text(
                        "lbl_street_name".tr,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.montserratGray60001,
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgSettings,
                  height: 46.h,
                  width: 30.h,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 198.h),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CustomAppBar(
                    height: 30.h,
                    leadingWidth: 154.h,
                    leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgSave,
                      height: 14.h,
                      width: 14.h,
                      margin: EdgeInsets.only(left: 140.h),
                    ),
                    title: SizedBox(
                      width: double.maxFinite,
                      child: Obx(
                        () => AppbarTitleDropdown(
                          margin: EdgeInsets.only(left: 17.h),
                          hintText: "lbl_school_name".tr,
                          items:
                              controller
                                  .iphone1415ProEightytwoModelObj
                                  .value
                                  .dropdownItemList!
                                  .value,
                          onTap: (value) {
                            controller.onSelected(value);
                          },
                        ),
                      ),
                    ),
                    actions: [
                      AppbarTrailingIconbutton(
                        imagePath: ImageConstant.imgUser,
                        margin: EdgeInsets.only(right: 127.h),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 92.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomOutlinedButton(
                                    width: 134.h,
                                    text: "lbl_drop".tr,
                                    leftIcon: Container(
                                      margin: EdgeInsets.only(right: 12.h),
                                      child: CustomImageView(
                                        imagePath: ImageConstant.imgVector,
                                        height: 26.h,
                                        width: 26.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    buttonStyle:
                                        CustomButtonStyles.outlinePrimary,
                                    buttonTextStyle:
                                        CustomTextStyles
                                            .titleSmallSecondaryContainer,
                                  ),
                                  CustomOutlinedButton(
                                    width: 134.h,
                                    text: "lbl_pickup".tr,
                                    leftIcon: Container(
                                      margin: EdgeInsets.only(right: 12.h),
                                      child: CustomImageView(
                                        imagePath:
                                            ImageConstant.imgUserWhiteA700,
                                        height: 26.h,
                                        width: 24.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
        ),
      ),
    );
  }
}
