import 'package:corona_tracker/models/district.dart';
import 'package:corona_tracker/models/state.dart';
import 'package:corona_tracker/models/timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:corona_tracker/screens/app/app_builder.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  final _appDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(_appDocumentDir.path);
  Hive.registerAdapter(StatesAdapter());
  Hive.registerAdapter(DistrictAdapter());
  Hive.registerAdapter(TimelineAdapter());

  return runApp(MyApp());
}
