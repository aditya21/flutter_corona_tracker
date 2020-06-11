import 'package:flutter/material.dart';

class StatesCardHeader extends StatelessWidget {
  final String district;

  StatesCardHeader({Key key, this.district}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    const double _cardRadius = 15;
    double customfontSize;
    final _size = MediaQuery.of(context).size;
    if (_size.height <= 750) {
      customfontSize = _theme.textTheme.display1.fontSize - 3;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_cardRadius),
          topRight: Radius.circular(_cardRadius),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            district,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: _theme.textTheme.display1.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: customfontSize ?? _theme.textTheme.display1.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
