import '../../../core/app_export.dart';
import '../controller/sign_up_welcome_controller.dart';

/// A binding class for the SignUpWelcomeScreen.
///
/// This class ensures that the SignUpWelcomeController is created when the
/// SignUpWelcomeScreen is first loaded.
class SignUpWelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpWelcomeController());
  }
}
