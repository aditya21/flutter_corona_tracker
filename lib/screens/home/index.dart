import 'dart:convert';

import 'package:corona_tracker/http/api_service.dart';
import 'package:corona_tracker/screens/dashboard/index.dart';
import 'package:corona_tracker/screens/help/index.dart';
import 'package:corona_tracker/screens/information/index.dart';
import 'package:corona_tracker/screens/states/index.dart';
import 'package:corona_tracker/screens/trends/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: TabBar(
        isScrollable: false,
        labelPadding: EdgeInsets.all(20),
        tabs: [
          Icon(Icons.public),
          Icon(Icons.sort_by_alpha),
          Icon(Icons.show_chart),
          Icon(Icons.info),
          Icon(Icons.help),
        ],
      ),
      body: FutureBuilder(
          future: Provider.of<ApiService>(context).getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Dashboard(),
                  States(),
                  Trends(),
                  Information(),
                  Help(),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
