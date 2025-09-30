import '../../../core/app_export.dart';
import '../controller/sign_up_splash_controller.dart';

/// A binding class for the SignUpSplashScreen.
///
/// This class ensures that the SignUpSplashController is created when the
/// SignUpSplashScreen is first loaded.
class SignUpSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpSplashController());
  }
}
