import '../../../core/app_export.dart';
import '../controller/iphone1415proeightytwocontroller.dart';


/// A binding class for the Iphone1415ProEightytwoScreen.
///
/// This class ensures that the Iphone1415ProEightytwoController is created when the
/// Iphone1415ProEightytwoScreen is first loaded.
class Iphone1415ProEightytwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProEightytwoController());
  }
}
