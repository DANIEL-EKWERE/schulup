import '../../../core/app_export.dart';
import '../controller/sign_two_controller.dart';

/// A binding class for the SignTwoScreen.
///
/// This class ensures that the SignTwoController is created when the
/// SignTwoScreen is first loaded.
class SignTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignTwoController());
  }
}
