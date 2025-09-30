import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/account_creation_one_model.dart';

/// A controller class for the AccountCreationOneScreen.
///
/// This class manages the state of the AccountCreationOneScreen, including the
/// current accountCreationOneModelObj
class AccountCreationOneController extends GetxController {
  Rx<AccountCreationOneModel> accountCreationOneModelObj =
      AccountCreationOneModel().obs;
}
