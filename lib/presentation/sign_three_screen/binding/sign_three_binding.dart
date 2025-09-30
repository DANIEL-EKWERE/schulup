import '../../../core/app_export.dart';
import '../controller/sign_three_controller.dart';

/// A binding class for the SignThreeScreen.
///
/// This class ensures that the SignThreeController is created when the
/// SignThreeScreen is first loaded.
class SignThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignThreeController());
  }
}
