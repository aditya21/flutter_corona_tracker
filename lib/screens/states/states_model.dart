import 'package:flutter/material.dart';

class StatesModel with ChangeNotifier {
  String selectedState;
  List<DropdownMenuItem> statesOptions;

  StatesModel(
    this.selectedState,
    this.statesOptions,
  );

  void changeState(String _newState) {
    selectedState = _newState;
    notifyListeners();
  }
}
