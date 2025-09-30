import '../../../../core/app_export.dart';
import '../controller/account_creation_one_controller.dart';

/// A binding class for the AccountCreationOneScreen.
///
/// This class ensures that the AccountCreationOneController is created when the
/// AccountCreationOneScreen is first loaded.
class AccountCreationOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountCreationOneController());
  }
}
