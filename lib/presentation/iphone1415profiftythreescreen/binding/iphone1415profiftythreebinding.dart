import '../../../core/app_export.dart';
import '../controller/iphone1415profiftythreecontroller.dart';


/// A binding class for the Iphone1415ProFiftythreeScreen.
///
/// This class ensures that the Iphone1415ProFiftythreeController is created when the
/// Iphone1415ProFiftythreeScreen is first loaded.
class Iphone1415ProFiftythreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone1415ProFiftythreeController());
  }
}
