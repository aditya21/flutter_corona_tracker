import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class StatesTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appState = Provider.of<Store>(context, listen: false).date;
    final timediff = timeago.format(_appState);
    final _date = DateFormat('d MMM y HH:mm').format(_appState);

    final _theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            'Monitoring Data',
            style: _theme.textTheme.display1,
          ),
          SizedBox(height: 10),
          Text(
            'updated $timediff $_date',
            overflow: TextOverflow.fade,
            style: _theme.textTheme.body1,
          ),
        ],
      ),
    );
  }
}
