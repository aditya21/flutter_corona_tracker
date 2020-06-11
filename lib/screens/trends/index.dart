import 'package:corona_tracker/screens/trends/chart.dart';
import 'package:flutter/material.dart';

class Trends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'SPREAD TRENDS',
                style: _theme.textTheme.display1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: TrendChart(
              backgroundColor: Color.fromRGBO(250, 224, 226, 1),
              title: 'CONFIRMED',
              textColor: Colors.red,
              type: 'confirmed',
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: TrendChart(
              backgroundColor: Color.fromRGBO(227, 243, 230, 1),
              title: 'RECOVERED',
              textColor: Colors.green,
              type: 'recovered',
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: TrendChart(
              backgroundColor: Color.fromRGBO(246, 246, 247, 1),
              title: 'DEAD',
              textColor: Colors.grey,
              type: 'dead',
            ),
          ),
        ],
      ),
    );
  }
}
