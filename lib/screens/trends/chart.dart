import 'package:corona_tracker/models/timeline.dart';
import 'package:corona_tracker/models/trend.dart';
import 'package:corona_tracker/store.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TrendChart extends StatefulWidget {
  final Color backgroundColor;
  final String title;
  final Color textColor;
  final String type;

  const TrendChart({
    Key key,
    this.backgroundColor,
    this.title,
    this.textColor,
    @required this.type,
  }) : super(key: key);

  @override
  _TrendChartState createState() => _TrendChartState();
}

class _TrendChartState extends State<TrendChart> {
  List<charts.Series<Trend, DateTime>> _seriesData;

  @override
  void initState() {
    _seriesData = List<charts.Series<Trend, DateTime>>();

    super.initState();
  }

  _generateData(BuildContext context) {
    List<Trend> data = List<Trend>();
    final List<Timeline> timelineList =
        Provider.of<Store>(context, listen: false).timeline;
    timelineList.sort((a, b) => a.date.compareTo(b.date));

    timelineList.forEach((value) {
      data.add(Trend(
        count: widget.type == 'confirmed'
            ? value.dailyConfirmed
            : (widget.type == 'recovered'
                ? value.dailyRecovered
                : value.dailyDeceased),
        day: value.date,
      ));
    });

    return _seriesData.add(
      charts.Series(
        data: data,
        domainFn: (Trend trend, _) => trend.day,
        measureFn: (Trend trend, _) => trend.count,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        id: 'con',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    _generateData(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5),
                child: Text(
                  widget.title,
                  style: _theme.textTheme.display1.copyWith(
                    fontSize: _theme.textTheme.display1.fontSize - 15,
                    color: widget.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 6,
              fit: FlexFit.tight,
              child: Container(
                child: charts.TimeSeriesChart(
                  _seriesData,
                  animate: true,
                  animationDuration: Duration(seconds: 2),

                  // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                  // should create the same type of [DateTime] as the data provided. If none
                  // specified, the default creates local date time.
                  dateTimeFactory: const charts.LocalDateTimeFactory(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
