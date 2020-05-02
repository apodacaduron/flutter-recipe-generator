import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:recipe_generator/components/elements/macroSeries.dart';

class DonutPieChart extends StatelessWidget {
  final List<MacroSeries> data;
  final bool animate;

  DonutPieChart(this.data, {this.animate});

  @override
  Widget build(BuildContext context) {  
    List<charts.Series<MacroSeries, String>> series = [
      charts.Series(
        id: 'Macros',
        domainFn: (MacroSeries series, _) => series.unit,
        measureFn: (MacroSeries series, _) => series.amount,
        data: data,
      )
    ];
    return new charts.PieChart(
      series,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60),
    );
  }
}
