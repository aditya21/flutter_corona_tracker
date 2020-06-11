import 'package:corona_tracker/controllers/states_controller.dart';
import 'package:corona_tracker/models/state.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class DashboardStatesList extends StatelessWidget {
  _buildRow(String _state, States _stateData, ThemeData _theme) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 3,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                _state,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: _buildDataRowStyle(_theme),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                _stateData.confirmed.toString(),
                textAlign: TextAlign.right,
                style: _buildDataRowStyle(_theme),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                _stateData.active.toString(),
                textAlign: TextAlign.right,
                style: _buildDataRowStyle(_theme),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                _stateData.recovered.toString(),
                textAlign: TextAlign.right,
                style: _buildDataRowStyle(_theme),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                _stateData.dead.toString(),
                textAlign: TextAlign.right,
                style: _buildDataRowStyle(_theme),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildDataColumnStyle(ThemeData _theme) => TextStyle(
        fontSize: _theme.textTheme.body1.fontSize - 2,
        fontWeight: FontWeight.bold,
      );
  _buildDataRowStyle(ThemeData _theme) => TextStyle(
        fontSize: _theme.textTheme.body1.fontSize,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    final List<States> _states = StatesController(context).getStatesList();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: StickyHeader(
          header: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    'STATE/UT',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: _buildDataColumnStyle(_theme),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    'CONFIRMED',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: _buildDataColumnStyle(_theme),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    'ACTIVE',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: _buildDataColumnStyle(_theme),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    'RECOVERED',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: _buildDataColumnStyle(_theme),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(
                    'DEAD',
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                    style: _buildDataColumnStyle(_theme),
                  ),
                ),
              ],
            ),
          ),
          content: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _states
                  .map((state) {
                    return _buildRow(state.state, state, _theme);
                  })
                  .toList()
                  .cast<Column>(),
            ),
          ),
        ),
      ),
    );
  }
}
