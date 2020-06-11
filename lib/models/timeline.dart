import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'timeline.g.dart';

@HiveType()
class Timeline {
  @HiveField(0)
  final int dailyConfirmed;

  @HiveField(1)
  final int dailyDeceased;

  @HiveField(2)
  final int dailyRecovered;

  @HiveField(3)
  final int totalConfirmed;

  @HiveField(4)
  final int totalDeceased;

  @HiveField(5)
  final int totalRecovered;

  @HiveField(6)
  final DateTime date;

  Timeline({
    @required this.dailyConfirmed,
    @required this.dailyDeceased,
    @required this.dailyRecovered,
    @required this.totalConfirmed,
    @required this.totalDeceased,
    @required this.totalRecovered,
    @required this.date,
  });

  Timeline.fromJson(Map<String, dynamic> json)
      : dailyConfirmed = int.parse(json['dailyconfirmed']),
        dailyDeceased = int.parse(json['dailydeceased']),
        dailyRecovered = int.parse(json['totalconfirmed']),
        totalConfirmed = int.parse(json['totaldeceased']),
        totalRecovered = int.parse(json['totalrecovered']),
        date = formatDate(json['date']),
        totalDeceased = int.parse(json['totaldeceased']);

  static DateTime formatDate(String str) {
    String day = str.substring(0, 2);

    String month = str.substring(3).trim();
    int monthNumber = getMonth(month);

    return DateTime(2020, monthNumber, int.parse(day));
  }

  static int getMonth(String month) {
    int number;
    switch (month) {
      case "January":
        number = 1;
        break;

      case "February":
        number = 2;
        break;

      case "March":
        number = 3;
        break;

      case "April":
        number = 4;
        break;

      case "May":
        number = 5;
        break;

      case "June":
        number = 6;
        break;

      case "July":
        number = 7;
        break;

      case "August":
        number = 8;
        break;

      case "September":
        number = 9;
        break;

      case "October":
        number = 10;
        break;

      case "November":
        number = 11;
        break;

      case "December":
        number = 12;
        break;

      default:
        number = 12;
        break;
    }

    return number;
  }
}
