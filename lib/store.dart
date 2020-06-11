import 'package:corona_tracker/models/district.dart';
import 'package:corona_tracker/models/state.dart';
import 'package:corona_tracker/models/timeline.dart';

class Store {
  List<States> states;
  List<District> districts;
  List<Timeline> timeline;
  DateTime date;

  Store(this.states, this.districts, this.timeline, this.date);

  void setStates(List<States> _newStates) {
    states = _newStates;
  }

  void setDistricts(List<States> _newDistricts) {
    states = _newDistricts;
  }
}
