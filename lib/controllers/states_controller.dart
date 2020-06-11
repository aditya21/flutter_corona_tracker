import 'package:corona_tracker/models/state.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatesController {
  final BuildContext context;

  StatesController(this.context);

  States getAllTotal() {
    final List<States> _data = Provider.of<Store>(context).states;
    return getTotal(_data);
  }

  States getTotal(List<States> _data) {
    return _data.firstWhere((test) => test.state == 'Total');
  }

  List<States> getStatesList() {
    final List<States> _data = Provider.of<Store>(context).states;
    return getStates(_data);
  }

  List<States> getStates(List<States> _data) {
    return _data.where((test) => test.state != 'Total').toList().cast<States>();
  }
}
