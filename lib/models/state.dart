import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'state.g.dart';

@HiveType()
class States {
  @HiveField(0)
  final int active;

  @HiveField(1)
  final int confirmed;

  @HiveField(2)
  final int dead;

  @HiveField(3)
  final int recovered;

  @HiveField(4)
  final int deltaConfirmed;

  @HiveField(5)
  final int deltaRecovered;

  @HiveField(6)
  final int deltaDeaths;

  @HiveField(7)
  final DateTime lastUpdatedTime;

  @HiveField(8)
  final String state;

  @HiveField(9)
  final String stateCode;

  States({
    @required this.active,
    @required this.confirmed,
    @required this.dead,
    @required this.recovered,
    this.deltaConfirmed,
    this.deltaRecovered,
    this.deltaDeaths,
    @required this.lastUpdatedTime,
    @required this.state,
    @required this.stateCode,
  });

  States.fromJson(Map<String, dynamic> json)
      : active = int.parse(json['active']),
        confirmed = int.parse(json['confirmed']),
        dead = int.parse(json['deaths']),
        recovered = int.parse(json['recovered']),
        deltaConfirmed = int.parse(json['deltaconfirmed']),
        deltaDeaths = int.parse(json['deltadeaths']),
        deltaRecovered = int.parse(json['deltarecovered']),
        state = json['state'],
        stateCode = json['statecode'],
        lastUpdatedTime =
            DateFormat('yyyy/MM/dd hh:mm:ss').parse(json['lastupdatedtime']);
}
