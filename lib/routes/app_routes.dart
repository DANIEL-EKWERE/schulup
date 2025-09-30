import '../core/app_export.dart';
import '../presentation/account_creation/account_creation.dart';
import '../presentation/account_creation/bindings/account_creation_binding.dart';
import '../presentation/account_creation_one_screen/account_creation_one_screen.dart';
import '../presentation/account_creation_one_screen/binding/account_creation_one_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/iphone1415proeightyonescreen/bindings/iphone1415proeightyonebinding.dart';
import '../presentation/iphone1415proeightyonescreen/iphone1415proeightyonescreen.dart';
import '../presentation/iphone1415proeightytwoscreen/binding/iphone1415proeightytwobinding.dart';
import '../presentation/iphone1415proeightytwoscreen/iphone1415proeightytwoscreen.dart';
import '../presentation/iphone1415profiftythreescreen/binding/iphone1415profiftythreebinding.dart';
import '../presentation/iphone1415profiftythreescreen/iphone1415profiftythreescreen.dart';
import '../presentation/iphone1415proseventyeightscreen/binding/iphone1415proseventyeightbinding.dart';
import '../presentation/iphone1415proseventyeightscreen/iphone1415proseventyeightscreen.dart';
import '../presentation/sign_five_screen/binding/sign_five_binding.dart';
import '../presentation/sign_five_screen/sign_five_screen.dart';
import '../presentation/sign_four_screen/binding/sign_four_binding.dart';
import '../presentation/sign_four_screen/sign_four_screen.dart';
import '../presentation/sign_three_screen/binding/sign_three_binding.dart';
import '../presentation/sign_three_screen/sign_three_screen.dart';
import '../presentation/sign_two_screen/binding/sign_two_binding.dart';
import '../presentation/sign_two_screen/sign_two_screen.dart';
import '../presentation/sign_up_splash_screen/binding/sign_up_splash_binding.dart';
import '../presentation/sign_up_splash_screen/sign_up_splash_screen.dart';
import '../presentation/sign_up_welcome_screen/binding/sign_up_welcome_binding.dart';
import '../presentation/sign_up_welcome_screen/sign_up_welcome_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String signUpSplashScreen = '/sign_up_splash_screen';

  static const String signUpWelcomeScreen = '/sign_up_welcome_screen';

  static const String signThreeScreen = '/sign_three_screen';

  static const String signTwoScreen = '/sign_two_screen';

  static const String iphone1415ProFiftythreeScreen =
      '/iphone_14_15_pro_fiftythree_screen';

  static const String iphone1415ProSeventyeightScreen =
      '/iphone_14_15_pro_seventyeight_screen';

  static const String accountCreationScreen = '/account_creation_screen';

  static const String iphone1415ProEightytwoScreen =
      '/iphone_14_15_pro_eightytwo_screen';

  static const String iphone1415ProEightyoneScreen =
      '/iphone_14_15_pro_eightyone_screen';

  static const String accountCreationOneScreen = '/account_creation_one_screen';

  static const String signFiveScreen = '/sign_five_screen';

  static const String signFourScreen = '/sign_four_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: signUpSplashScreen,
      page: () => SignUpSplashScreen(),
      bindings: [SignUpSplashBinding()],
    ),
    GetPage(
      name: signUpWelcomeScreen,
      page: () => SignUpWelcomeScreen(),
      bindings: [SignUpWelcomeBinding()],
    ),
    GetPage(
      name: signThreeScreen,
      page: () => SignThreeScreen(),
      bindings: [SignThreeBinding()],
    ),
    GetPage(
      name: signTwoScreen,
      page: () => SignTwoScreen(),
      bindings: [SignTwoBinding()],
    ),
    GetPage(
      name: iphone1415ProFiftythreeScreen,
      page: () => Iphone1415ProFiftythreeScreen(),
      bindings: [Iphone1415ProFiftythreeBinding()],
    ),
    GetPage(
      name: iphone1415ProSeventyeightScreen,
      page: () => Iphone1415ProSeventyeightScreen(),
      bindings: [Iphone1415ProSeventyeightBinding()],
    ),
    GetPage(
      name: accountCreationScreen,
      page: () => AccountCreationScreen(),
      bindings: [AccountCreationBinding()],
    ),
    GetPage(
      name: iphone1415ProEightytwoScreen,
      page: () => Iphone1415ProEightytwoScreen(),
      bindings: [Iphone1415ProEightytwoBinding()],
    ),
    GetPage(
      name: iphone1415ProEightyoneScreen,
      page: () => Iphone1415ProEightyoneScreen(),
      bindings: [Iphone1415ProEightyoneBinding()],
    ),
    GetPage(
      name: accountCreationOneScreen,
      page: () => AccountCreationOneScreen(),
      bindings: [AccountCreationOneBinding()],
    ),
    GetPage(
      name: signFiveScreen,
      page: () => SignFiveScreen(),
      bindings: [SignFiveBinding()],
    ),
    GetPage(
      name: signFourScreen,
      page: () => SignFourScreen(),
      bindings: [SignFourBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => SignUpSplashScreen(),
      bindings: [SignUpSplashBinding()],
    ),
  ];
}
