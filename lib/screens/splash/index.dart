import 'package:chopper/chopper.dart';
import 'package:corona_tracker/http/api_service.dart';
import 'package:corona_tracker/models/district.dart';
import 'package:corona_tracker/models/state.dart';
import 'package:corona_tracker/models/timeline.dart';
import 'package:corona_tracker/screens/app/theme_builder.dart';
import 'package:corona_tracker/screens/home/index.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  Future _loadData(BuildContext context) async {
    final Box statesBox = await Hive.openBox('state');
    List<States> _data = await _getStateWiseData(statesBox, context);

    final Box districtBox = await Hive.openBox('district');
    List<District> _districtData =
        await _getDistrictWiseData(districtBox, context);

    final Box timelineBox = await Hive.openBox('timeline');
    List<Timeline> _timelineData = await _getTimeline(timelineBox, context);

    return {
      'state': _data,
      'district': _districtData,
      'timeline': _timelineData,
    };
  }

  Future<List<Timeline>> _getTimeline(Box _box, BuildContext _context) async {
    List<Timeline> _data = List<Timeline>();

    // if (_box.isEmpty) {
    final Response result =
        await Provider.of<ApiService>(context, listen: false).getAll();

    result.body['cases_time_series'].forEach((value) {
      _data.add(Timeline.fromJson(value));
    });

    //   _box.addAll(_data);
    // } else {
    //   _data = _box.values.toList().cast<Timeline>();
    // }

    return _data;
  }

  Future<List<States>> _getStateWiseData(Box _box, BuildContext context) async {
    List<States> _data = List<States>();
    // if (_box.isEmpty) {
    final Response data =
        await Provider.of<ApiService>(context, listen: false).getAll();

    data.body['statewise'].forEach((value) {
      _data.add(States.fromJson(value));
    });

    // _box.addAll(_data);
    // print(data.body['cases_time_series']);
    // _addData(jsonDecode(data.body));
    // } else {
    //   _data = _box.values.toList().cast<States>();
    // }

    return _data;
  }

  Future<List<District>> _getDistrictWiseData(
      Box _box, BuildContext context) async {
    List<District> _data = List<District>();

    // if (_box.isEmpty) {
    final Response data =
        await Provider.of<ApiService>(context, listen: false).getStates();
    Map<String, dynamic> _districtMap = Map<String, dynamic>();
    data.body.forEach((value) {
      value['districtData'].forEach((districtData) {
        _districtMap = districtData;
        _districtMap['state'] = value['state'];
        // print(_districtMap)
        _data.add(District.fromJson(_districtMap));
      });
    });

    //   _box.addAll(_data);
    // } else {
    //   _data = _box.values.toList().cast<District>();
    // }

    return _data;
  }

  @override
  Widget build(BuildContext context) {
    _loadData(context).then((value) {
      Future.delayed(Duration(seconds: 5), () {
        final Size _size = MediaQuery.of(context).size;

        if (_size.height <= 750) {
          TextTheme _textTheme = TextTheme(
            display1: TextStyle(
              fontSize: Theme.of(context).textTheme.display1.fontSize - 8,
            ),
            body1: TextStyle(
              fontSize: Theme.of(context).textTheme.body1.fontSize - 4,
            ),
          );

          ThemeBuilder.of(context).setTheme(_textTheme);
        }

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => DefaultTabController(
              length: 5,
              initialIndex: 0,
              child: Provider(
                create: (_) => Store(value['state'], value['district'],
                    value['timeline'], DateTime.now()),
                child: MyHomePage(),
              ),
            ),
          ),
        );
      });
    });
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(_size.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('assets/images/virus.svg'),
          Flexible(
            // height: 200,
            // width: 300,
            child: Marquee(
              text:
                  'Stay at home..        Wash your hands frequently..           Cover you mouth with mask..',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: Duration(seconds: 2),
              accelerationCurve: Curves.linear,
              decelerationDuration: Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          )
          // CircularProgressIndicator(),
        ],
      ),
    );
  }
}
