import '../../../core/app_export.dart';
import '../controller/sign_five_controller.dart';

/// A binding class for the SignFiveScreen.
///
/// This class ensures that the SignFiveController is created when the
/// SignFiveScreen is first loaded.
class SignFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignFiveController());
  }
}
