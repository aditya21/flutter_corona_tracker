import 'package:corona_tracker/http/api_service.dart';
import 'package:corona_tracker/screens/app/theme_builder.dart';
import 'package:corona_tracker/screens/splash/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Provider(
      // builder: (_) => ApiService.create(),
      create: (_) => ApiService.create(),
      dispose: (context, ApiService serviceApi) => serviceApi.client.dispose(),
      child: ThemeBuilder(),
    );
  }
}
