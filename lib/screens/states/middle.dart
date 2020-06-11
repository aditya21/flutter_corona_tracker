import 'package:corona_tracker/models/district.dart';
import 'package:corona_tracker/screens/states/card_items/header.dart';
import 'package:corona_tracker/screens/states/card_items/middle.dart';
import 'package:corona_tracker/screens/states/states_model.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatesMiddle extends StatelessWidget {
  _loadDistricts(String _state, List<District> _districts) {
    final list = _districts
        .where((item) {
          return item.state == _state;
        })
        .toList()
        .cast<District>();
    list.sort((a, b) => a.confirmed.compareTo(b.confirmed));

    return list.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    const double _cardRadius = 15;
    final _size = MediaQuery.of(context).size;
    final double mainWidth = MediaQuery.of(context).size.width * 0.9;
    final String selectedState =
        Provider.of<StatesModel>(context, listen: true).selectedState;
    final List<District> districts =
        Provider.of<Store>(context, listen: false).districts;
    final List<District> _selecteStateDistricts =
        _loadDistricts(selectedState, districts);

    final _controller = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );

    return SizedBox(
      width: mainWidth,
      height: _size.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: _controller,
        children: _selecteStateDistricts.map((item) {
          return Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_cardRadius),
            ),
            child: Column(
              children: <Widget>[
                StatesCardHeader(
                  district: item.district,
                ),
                StatesCardMiddle(
                  count: item.confirmed,
                ),
                // StatesCardBottom(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
