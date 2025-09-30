import '../../../core/app_export.dart';
import '../controller/iphone1415proeightyonecontroller.dart';


/// A binding class for the Iphone1415ProEightyoneScreen.
///
/// This class ensures that the Iphone1415ProEightyoneController is created when the
/// Iphone1415ProEightyoneScreen is first loaded.
class Iphone1415ProEightyoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProEightyoneController());
  }
}
