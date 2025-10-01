// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../core/app_export.dart';
// import '../../data/models/selectionPopupModel/selection_popup_model.dart';
// import '../../theme/custom_button_style.dart';
// import '../../widgets/app_bar/appbar_leading_image.dart';
// import '../../widgets/app_bar/appbar_title_dropdown.dart';
// import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
// import '../../widgets/app_bar/custom_appbar.dart';
// import '../../widgets/custom_outlined_button.dart';
// import 'controller/iphone1415profiftythreecontroller.dart';

// class Iphone1415ProFiftythreeScreen extends GetWidget<Iphone1415ProFiftythreeController> {
//   const Iphone1415ProFiftythreeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appTheme.gray50,
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: SingleChildScrollView(
//             child: SizedBox(
//               height: 792.h,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   _buildGoogleMap(),
//                   _buildMapOverlay(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Google Map Widget
//   Widget _buildGoogleMap() {
//     return SizedBox(
//       height: 784.h,
//       width: double.infinity,
//       child: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(37.43296265331129, -122.08832357078792),
//           zoom: 14.4746,
//         ),
//         onMapCreated: (GoogleMapController mapController) {
//           controller.googleMapController.complete(mapController);
//         },
//         zoomControlsEnabled: false,
//         zoomGesturesEnabled: false,
//         myLocationButtonEnabled: false,
//         myLocationEnabled: false,
//       ),
//     );
//   }

//   /// Map Overlay with Street Names and Controls
//   Widget _buildMapOverlay() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: IntrinsicWidth(
//           child: SizedBox(
//             height: 792.h,
//             width: 620.h,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 _buildStreetNamesOverlay(),
//                 _buildAppBar(),
//                 _buildLocationMarker(),
//                 _buildBottomButtons(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   /// Street Names Overlay
//   Widget _buildStreetNamesOverlay() {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: SizedBox(
//         width: double.maxFinite,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               width: double.maxFinite,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   margin: EdgeInsets.only(left: 130.h),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 36.h,
//                     vertical: 12.h,
//                   ),
//                   decoration: AppDecoration.row3,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       // First street name (rotated)
//                       _buildRotatedStreetName(
//                         text: "lbl_street_name".tr,
//                         rotation: -20,
//                         width: 30.h,
//                         maxLines: 3,
//                         bottomMargin: 96.h,
//                       ),

//                       // "Street" label
//                       Padding(
//                         padding: EdgeInsets.only(left: 48.h, bottom: 4.h),
//                         child: Text(
//                           "lbl_street".tr,
//                           style: theme.textTheme.labelSmall,
//                         ),
//                       ),

//                       // Second street name (rotated)
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: _buildRotatedStreetName(
//                           text: "lbl_street_name".tr,
//                           rotation: 78,
//                           width: 10.h,
//                           maxLines: 5,
//                           leftMargin: 84.h,
//                           bottomMargin: 258.h,
//                         ),
//                       ),

//                       // Third street name (rotated)
//                       _buildRotatedStreetName(
//                         text: "lbl_street_name".tr,
//                         rotation: 64,
//                         width: 16.h,
//                         maxLines: 5,
//                         leftMargin: 36.h,
//                         bottomMargin: 88.h,
//                       ),

//                       // "Lower Vailsburg" label
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 54.h, top: 82.h),
//                           child: Text(
//                             "lbl_lowervailsburg".tr,
//                             style: theme.textTheme.labelSmall,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Helper: Build Rotated Street Name
//   Widget _buildRotatedStreetName({
//     required String text,
//     required double rotation,
//     required double width,
//     required int maxLines,
//     double leftMargin = 0,
//     double bottomMargin = 0,
//   }) {
//     return Container(
//       width: width,
//       margin: EdgeInsets.only(left: leftMargin, bottom: bottomMargin),
//       child: RotationTransition(
//         turns: AlwaysStoppedAnimation(-(rotation / 360)),
//         child: Text(
//           text,
//           maxLines: maxLines,
//           overflow: TextOverflow.ellipsis,
//           style: CustomTextStyles.montserratGray60001,
//         ),
//       ),
//     );
//   }

//   /// Additional Street Labels
//   Widget _buildAdditionalStreetLabels() {
//     return Stack(
//       children: [
//         // "Union" label
//         Align(
//           alignment: Alignment.topLeft,
//           child: Padding(
//             padding: EdgeInsets.only(left: 224.h, top: 92.h),
//             child: Text(
//               "lbl_union".tr,
//               style: theme.textTheme.labelSmall,
//             ),
//           ),
//         ),

//         // Bottom center street name
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: 18.h,
//             margin: EdgeInsets.only(bottom: 216.h),
//             child: RotationTransition(
//               turns: AlwaysStoppedAnimation(-(64 / 360)),
//               child: Text(
//                 "lbl_street_name".tr,
//                 maxLines: 5,
//                 overflow: TextOverflow.ellipsis,
//                 style: CustomTextStyles.montserratGray60001,
//               ),
//             ),
//           ),
//         ),

//         // Top left street name
//         Align(
//           alignment: Alignment.topLeft,
//           child: Container(
//             width: 26.h,
//             margin: EdgeInsets.only(left: 156.h, top: 114.h),
//             child: RotationTransition(
//               turns: AlwaysStoppedAnimation(-(-41 / 360)),
//               child: Text(
//                 "lbl_street_name".tr,
//                 maxLines: 4,
//                 overflow: TextOverflow.ellipsis,
//                 style: CustomTextStyles.montserratGray60001,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   /// App Bar with Dropdown
//   Widget _buildAppBar() {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: CustomAppBar(
//         height: 30.h,
//         leadingWidth: 154.h,
//         leading: AppbarLeadingImage(
//           imagePath: ImageConstant.imgSave,
//           height: 14.h,
//           width: 14.h,
//           margin: EdgeInsets.only(left: 140.h),
//         ),
//         title: SizedBox(
//           width: double.maxFinite,
//           child: Obx(
//             () => AppbarTitleDropdown(
//               margin: EdgeInsets.only(left: 17.h),
//               hintText: "lbl_school_name".tr,
//               items: controller.iphone1415ProFiftythreeModelObj.value.dropdownItemList!.value,
//               onTap: (value) {
//                 controller.onSelected(value);
//               },
//             ),
//           ),
//         ),
//         actions: [
//           AppbarTrailingIconbutton(
//             onTap: () {
//               Get.toNamed(AppRoutes.signFiveScreen);
//             },
//             imagePath: ImageConstant.imgUser,
//             margin: EdgeInsets.only(right: 127.h),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Location Marker Icon
//   Widget _buildLocationMarker() {
//     return CustomImageView(
//       imagePath: ImageConstant.imgSettings,
//       height: 46.h,
//       width: 30.h,
//       alignment: Alignment.topCenter,
//       margin: EdgeInsets.only(top: 198.h),
//     );
//   }

//   /// Bottom Action Buttons
//   Widget _buildBottomButtons() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: EdgeInsets.only(bottom: 92.h),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Drop Button
//             CustomOutlinedButton(
//               onPressed: () {
//                 Get.toNamed(AppRoutes.iphone1415ProSeventyeightScreen);
//               },
//               width: 134.h,
//               text: "lbl_drop".tr,
//               leftIcon: Container(
//                 margin: EdgeInsets.only(right: 12.h),
//                 child: CustomImageView(
//                   imagePath: ImageConstant.imgVector,
//                   height: 26.h,
//                   width: 26.h,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               buttonStyle: CustomButtonStyles.outlinePrimary,
//               buttonTextStyle: CustomTextStyles.titleSmallSecondaryContainer,
//             ),

//             SizedBox(width: 20.h),

//             // Pickup Button
//             CustomOutlinedButton(
//               onPressed: () {
//                 Get.toNamed(AppRoutes.iphone1415ProEightyoneScreen);
//               },
//               width: 134.h,
//               text: "lbl_pickup".tr,
//               leftIcon: Container(
//                 margin: EdgeInsets.only(right: 12.h),
//                 child: CustomImageView(
//                   imagePath: ImageConstant.imgUserWhiteA700,
//                   height: 26.h,
//                   width: 24.h,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:schoolruns/presentation/iphone1415profiftythreescreen/scan.dart';
import '../../core/app_export.dart';
import '../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title_dropdown.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_appbar.dart';
import '../../widgets/custom_outlined_button.dart';
import 'controller/iphone1415profiftythreecontroller.dart';

class Iphone1415ProFiftythreeScreen
    extends GetWidget<Iphone1415ProFiftythreeController> {
  const Iphone1415ProFiftythreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray50,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(children: [_buildGoogleMap(), _buildMapOverlay()]),
        ),
      ),
    );
  }

  /// Google Map Widget
  Widget _buildGoogleMap() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController mapController) {
          controller.googleMapController.complete(mapController);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Map Overlay with Street Names and Controls
  Widget _buildMapOverlay() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _buildStreetNamesOverlay(),
          _buildAppBar(),
          _buildLocationMarker(),
          _buildBottomButtons(),
        ],
      ),
    );
  }

  /// Street Names Overlay
  Widget _buildStreetNamesOverlay() {
    return Stack(
      children: [
        // First rotated street name - top left area
        Positioned(
          left: 130.h,
          top: 200.h,
          child: _buildRotatedStreetName(
            text: "lbl_street_name".tr,
            rotation: -20,
            width: 30.h,
            maxLines: 3,
          ),
        ),

        // "Street" label
        Positioned(
          left: 180.h,
          top: 290.h,
          child: Text("lbl_street".tr, style: theme.textTheme.labelSmall),
        ),

        // Second rotated street name - middle area
        Positioned(
          left: 264.h,
          top: 40.h,
          child: _buildRotatedStreetName(
            text: "lbl_street_name".tr,
            rotation: 78,
            width: 10.h,
            maxLines: 5,
          ),
        ),

        // Third rotated street name - right area
        Positioned(
          left: 300.h,
          top: 200.h,
          child: _buildRotatedStreetName(
            text: "lbl_street_name".tr,
            rotation: 64,
            width: 16.h,
            maxLines: 5,
          ),
        ),

        // "Lower Vailsburg" label
        Positioned(
          left: 354.h,
          top: 82.h,
          child: Text(
            "lbl_lowervailsburg".tr,
            style: theme.textTheme.labelSmall,
          ),
        ),

        // "Union" label
        Positioned(
          left: 224.h,
          top: 92.h,
          child: Text("lbl_union".tr, style: theme.textTheme.labelSmall),
        ),

        // Bottom center rotated street name
        Positioned(
          left: 0,
          right: 0,
          bottom: 216.h,
          child: Center(
            child: _buildRotatedStreetName(
              text: "lbl_street_name".tr,
              rotation: 64,
              width: 18.h,
              maxLines: 5,
            ),
          ),
        ),

        // Top left rotated street name
        Positioned(
          left: 156.h,
          top: 114.h,
          child: _buildRotatedStreetName(
            text: "lbl_street_name".tr,
            rotation: -41,
            width: 26.h,
            maxLines: 4,
          ),
        ),
      ],
    );
  }

  /// Helper: Build Rotated Street Name
  Widget _buildRotatedStreetName({
    required String text,
    required double rotation,
    required double width,
    required int maxLines,
  }) {
    return SizedBox(
      width: width,
      child: Transform.rotate(
        angle: rotation * (3.14159 / 180), // Convert degrees to radians
        child: Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.montserratGray60001,
        ),
      ),
    );
  }

  /// App Bar with Dropdown
  Widget _buildAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: CustomAppBar(
        height: 60.h,
        leadingWidth: 35.h,
        leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgSave,
          height: 14.h,
          width: 14.h,
          margin: EdgeInsets.only(left: 16.h),
        ),
        title: Obx(
          () =>
              controller.name.value.isNotEmpty
                  ? Text(controller.name.value)
                  : Text("lbl_school_name".tr),
          // AppbarTitleDropdown(
          //   margin: EdgeInsets.only(left: 8.h),
          //   hintText: "lbl_school_name".tr,
          //   // // items:
          //   // //     controller
          //   // //         .iphone1415ProFiftythreeModelObj
          //   // //         .value
          //   // //         .dropdownItemList!
          //   // //         .value,
          //   // // onTap: (value) {
          //   // //   controller.onSelected(value);
          //   // },
          // ),
        ),
        actions: [
          AppbarTrailingIconbutton(
            onTap: () {
              Get.toNamed(AppRoutes.signFiveScreen);
            },
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.only(right: 16.h),
          ),
        ],
      ),
    );
  }

  /// Location Marker Icon
  Widget _buildLocationMarker() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgSettings,
              height: 46.h,
              width: 30.h,
            ),
            SizedBox(height: 100.h), // Offset to account for visual center
          ],
        ),
      ),
    );
  }

  /// Bottom Action Buttons
  Widget _buildBottomButtons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 40.h,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drop Button
            CustomOutlinedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.iphone1415ProSeventyeightScreen);
              },
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
              buttonStyle: CustomButtonStyles.outlinePrimary,
              buttonTextStyle: CustomTextStyles.titleSmallSecondaryContainer,
            ),

            SizedBox(width: 20.h),

            // Pickup Button
            CustomOutlinedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.iphone1415ProEightyoneScreen);
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


            SizedBox(width: 20.h),

            // Pickup Button
            CustomOutlinedButton(
              onPressed: () {
                Get.to(RFIDReaderScreen());
              },
              width: 134.h,
              text: "scan",
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
      ),
    );
  }
}
