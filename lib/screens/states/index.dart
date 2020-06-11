import 'package:corona_tracker/models/district.dart';
import 'package:corona_tracker/screens/states/bottom.dart';
import 'package:corona_tracker/screens/states/middle.dart';
import 'package:corona_tracker/screens/states/states_model.dart';
import 'package:corona_tracker/screens/states/top.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class States extends StatelessWidget {
  LinearGradient _buildGradient() {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Colors.indigo[700], Colors.indigo[700], Colors.green[200]],
    );
  }

  BoxDecoration _buildContainerStyle() {
    return BoxDecoration(
      borderRadius: _buildContainerBorderRadius(),
      // gradient: _buildGradient(),
    );
  }

  BorderRadius _buildContainerBorderRadius() {
    return BorderRadius.only(
      bottomLeft: Radius.circular(45),
      bottomRight: Radius.circular(45),
    );
  }

  Map<String, dynamic> _loadStates(List<District> _data) {
    List<DropdownMenuItem> _list = List<DropdownMenuItem>();
    Set<String> state = Set();

    _data.forEach((value) {
      if (state.add(value.state)) {
        _list.add(
            DropdownMenuItem(value: value.state, child: Text(value.state)));
      }
    });

    return {'options': _list, 'firstState': state.first};
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final List<District> _data =
        Provider.of<Store>(context, listen: false).districts;
    final Map<String, dynamic> _result = _loadStates(_data);
    return ChangeNotifierProvider(
      create: (_) => StatesModel(_result['firstState'], _result['options']),
      child: Container(
        height: _size.height * 0.93,
        decoration: _buildContainerStyle(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            StatesTop(),
            StatesMiddle(),
            StatesBottom(),
          ],
        ),
      ),
    );
  }
}
