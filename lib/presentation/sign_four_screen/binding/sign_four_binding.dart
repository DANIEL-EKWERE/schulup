import '../../../core/app_export.dart';
import '../controller/sign_four_controller.dart';

/// A binding class for the SignFourScreen.
///
/// This class ensures that the SignFourController is created when the
/// SignFourScreen is first loaded.
class SignFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignFourController());
  }
}
