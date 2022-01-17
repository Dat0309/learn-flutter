import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool? animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Statistic, int>> _createSampleData() {
    final data = [
      new Statistic(0, 25, Colors.redAccent),
      new Statistic(1, 75, Colors.yellowAccent),
      new Statistic(2, 150, Colors.blueAccent),
    ];

    return [
      new charts.Series<Statistic, int>(
        id: 'Sales',
        domainFn: (Statistic statistic, _) => statistic.id,
        measureFn: (Statistic statistic, _) => statistic.value,
        colorFn: (Statistic statistic, _) =>
            charts.ColorUtil.fromDartColor(statistic.color),
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class Statistic {
  final int id;
  final int value;
  final Color color;

  Statistic(this.id, this.value, this.color);
}
