import 'package:corona_tracker/controllers/states_controller.dart';
import 'package:corona_tracker/models/state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GridItems extends StatefulWidget {
  @override
  _GridItemsState createState() => _GridItemsState();
}

class _GridItemsState extends State<GridItems> {
  States _total;
  double factor;
  NumberFormat _numberFormat = NumberFormat('#,###');
  initState() {
    super.initState();
  }

  _buildKeyCard({ThemeData theme, String title, int count, Color color}) =>
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: theme.textTheme.display1.copyWith(
                fontSize: (theme.textTheme.display1.fontSize - 9),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _numberFormat.format(count).toString(),
              style: theme.textTheme.display1,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    _total = StatesController(context).getAllTotal();
    final _theme = Theme.of(context);
    factor = MediaQuery.of(context).textScaleFactor;

    return GridView(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 2 / 2),
      children: <Widget>[
        _buildKeyCard(
          theme: _theme,
          count: _total.confirmed,
          title: 'Confirmed',
          color: Colors.redAccent,
        ),
        _buildKeyCard(
          theme: _theme,
          count: _total.active,
          title: 'Active',
          color: Colors.blueAccent,
        ),
        _buildKeyCard(
          theme: _theme,
          count: _total.recovered,
          title: 'Recovered',
          color: Colors.greenAccent,
        ),
        _buildKeyCard(
          theme: _theme,
          count: _total.dead,
          title: 'Dead',
          color: Colors.grey[600],
        ),
      ],
    );
  }
}
