import 'package:corona_tracker/models/district.dart';
import 'package:corona_tracker/screens/states/states_model.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class StatesBottom extends StatefulWidget {
  @override
  _StatesBottomState createState() => _StatesBottomState();
}

class _StatesBottomState extends State<StatesBottom> {
  String selectedValue;
  double customfontSize;

  _buildSelectedValue(ThemeData _theme, String value) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,

              // softWrap: true,
              style: _theme.textTheme.headline.copyWith(
                // fontSize: _theme.textTheme.display1.fontSize - 10,
                fontSize: customfontSize ?? _theme.textTheme.headline.fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 40,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _size = MediaQuery.of(context).size;
    selectedValue = Provider.of<StatesModel>(context).selectedState;
    final List<DropdownMenuItem> items =
        Provider.of<StatesModel>(context).statesOptions;

    if (_size.height <= 750) {
      customfontSize = _theme.textTheme.headline.fontSize - 3;
    }

    return Center(
      child: Container(
        width: _size.width * 0.7,
        margin: EdgeInsets.only(left: 40),
        child: SearchableDropdown.single(
          items: items,
          displayClearIcon: false,
          underline: "",
          icon: "",
          // value: _buildSelectedValue(_theme, selectedValue),
          selectedValueWidgetFn: (item) =>
              _buildSelectedValue(_theme, item.toString()),
          hint: _buildSelectedValue(_theme, selectedValue),
          searchHint: "Select state",
          onChanged: (value) {
            setState(() {
              Provider.of<StatesModel>(context, listen: false)
                  .changeState(value);
            });
          },
          isExpanded: true,
        ),
      ),
    );
  }
}
