import 'package:flutter/material.dart';

class StatesCardMiddle extends StatelessWidget {
  final int count;

  const StatesCardMiddle({Key key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            count.toString(),
            style: _theme.textTheme.display1.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Positive',
            style: _theme.textTheme.display1.copyWith(color: Colors.red),
          )
        ],
      ),
    );
  }
}
