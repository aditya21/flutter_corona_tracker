import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/images/symptoms.png'),
          Text(
            'HOW IT SPREADS',
            style: _theme.textTheme.headline.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.orange[800],
            ),
          ),
          Image.asset('assets/images/block_one.png'),
          Text(
            'PREVENTION',
            style: _theme.textTheme.headline.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green[600],
            ),
          ),
          Image.asset('assets/images/block_two.png'),
        ],
      ),
    );
  }
}
