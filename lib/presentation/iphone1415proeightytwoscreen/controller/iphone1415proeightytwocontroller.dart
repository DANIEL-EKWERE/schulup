import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/iphone1415proeightytwomodel.dart';


/// A controller class for the Iphone1415ProEightytwoScreen.
///
/// This class manages the state of the Iphone1415ProEightytwoScreen, including the
/// current iphone1415ProEightytwoModelObj
class Iphone1415ProEightytwoController extends GetxController {
  Rx<Iphone1415ProEightytwoModel> iphone1415ProEightytwoModelObj =
      Iphone1415ProEightytwoModel().obs;

 // Completer<GoogleMapController> googleMapController = Completer();

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element
        in iphone1415ProEightytwoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone1415ProEightytwoModelObj.value.dropdownItemList.refresh();
  }
}
