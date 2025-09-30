import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/app_navigation_controller.dart'; // ignore_for_file: must_be_immutable

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SafeArea(
        child: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "Check your app's UI from the below demo screens of your app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF888888),
                          fontSize: 16.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Divider(
                      height: 1.h,
                      thickness: 1.h,
                      color: Color(0XFF000000),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "SIGN UP SPLASH SCREEN",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.signUpSplashScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SIGN UP WELCOME SCREEN",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.signUpWelcomeScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SIGN Three",
                          onTapScreenTitle:
                              () => onTapScreenTitle(AppRoutes.signThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SIGN Two",
                          onTapScreenTitle:
                              () => onTapScreenTitle(AppRoutes.signTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro - FiftyThree",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.iphone1415ProFiftythreeScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro - SeventyEight",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.iphone1415ProSeventyeightScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "ACCOUNT CREATION",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.accountCreationScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro - EightyTwo",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.iphone1415ProEightytwoScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "iPhone 14 & 15 Pro - EightyOne",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.iphone1415ProEightyoneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "ACCOUNT CREATION One",
                          onTapScreenTitle:
                              () => onTapScreenTitle(
                                AppRoutes.accountCreationOneScreen,
                              ),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SIGN Five",
                          onTapScreenTitle:
                              () => onTapScreenTitle(AppRoutes.signFiveScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "SIGN Four",
                          onTapScreenTitle:
                              () => onTapScreenTitle(AppRoutes.signFourScreen),
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
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 5.h),
            Divider(height: 1.h, thickness: 1.h, color: Color(0XFF888888)),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
