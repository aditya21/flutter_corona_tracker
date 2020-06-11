import 'package:flutter/material.dart';

class StatesCardBottom extends StatelessWidget {
  _buildRowItem(ThemeData _theme, String _count, String _purpose) {
    return Column(
      children: <Widget>[
        Text(
          _count,
          style: _theme.textTheme.display1
              .copyWith(color: Colors.red, fontWeight: FontWeight.w700),
        ),
        Text(
          _purpose,
          style: _theme.textTheme.body1.copyWith(color: Colors.red),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildRowItem(_theme, '780', 'in care'),
          _buildRowItem(_theme, '35', 'recovered'),
          _buildRowItem(_theme, '78', 'dead'),
        ],
      ),
    );
  }
}
