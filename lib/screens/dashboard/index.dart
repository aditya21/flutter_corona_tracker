import 'package:corona_tracker/screens/dashboard/key_items.dart';
import 'package:corona_tracker/screens/dashboard/states_list.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class Dashboard extends StatelessWidget {
  _buildUpdatedTimeStyle(ThemeData _theme) => _theme.textTheme.body1.copyWith(
        fontSize: _theme.textTheme.body1.fontSize - 3,
        color: Colors.green[200],
      );

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _appState = Provider.of<Store>(context, listen: false).date;
    final timediff = timeago.format(_appState, locale: 'en_short');
    final _date = DateFormat('d MMM y HH:mm').format(_appState);

    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'INDIA COVID-19',
                      style: _theme.textTheme.display1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 20.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('LAST UPDATED',
                        style: _buildUpdatedTimeStyle(_theme)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // top: 10.0,
                    left: 20.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'ABOUT $timediff AGO, $_date IST',
                      style: _buildUpdatedTimeStyle(_theme),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    // top: 10.0,
                    left: 20.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '$_date IST',
                      style: _buildUpdatedTimeStyle(_theme),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GridItems(),
            ),
          ),
          Flexible(
            flex: 3,
            child: DashboardStatesList(),
          )
        ],
      ),
    );
  }
}
