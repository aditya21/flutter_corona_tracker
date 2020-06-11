import 'package:corona_tracker/screens/splash/index.dart';
import 'package:flutter/material.dart';

class ThemeBuilder extends StatefulWidget {
  static _ThemeBuilderState of(BuildContext context) {
    return context.findAncestorStateOfType<_ThemeBuilderState>();
  }

  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  TextTheme customTextTheme;

  void setTheme(TextTheme newTextTheme) {
    print('changing');
    setState(() {
      customTextTheme = newTextTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: customTextTheme ?? Theme.of(context).textTheme,
      ),
      home: Splash(),
      darkTheme: ThemeData(
        fontFamily: 'Kobern',
        brightness: Brightness.dark,
        // textTheme:
      ),
    );
  }
}
