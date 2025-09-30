import '../../../core/app_export.dart';
import '../controller/iphone1415proseventyeightcontroller.dart';


/// A binding class for the Iphone1415ProSeventyeightScreen.
///
/// This class ensures that the Iphone1415ProSeventyeightController is created when the
/// Iphone1415ProSeventyeightScreen is first loaded.
class Iphone1415ProSeventyeightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProSeventyeightController());
  }
}
