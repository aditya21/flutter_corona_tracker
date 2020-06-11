import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'district.g.dart';

@HiveType()
class District {
  @HiveField(0)
  final String state;

  @HiveField(1)
  final int confirmed;

  @HiveField(2)
  final DateTime lastUpdatedTime;

  @HiveField(3)
  final int deltaConfirmed;

  @HiveField(4)
  final String district;

  District({
    @required this.state,
    @required this.confirmed,
    this.lastUpdatedTime,
    this.deltaConfirmed,
    @required this.district,
  });

  District.fromJson(Map<String, dynamic> json)
      : state = json['state'],
        confirmed = json['confirmed'],
        district = json['district'],
        lastUpdatedTime =
            DateFormat('yyyy-mm-dd hh:mm').parse(DateTime.now().toString()),
        deltaConfirmed = json['delta']['confirmed'];
}
