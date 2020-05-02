import 'package:charts_flutter/flutter.dart' as charts;

class MacroSeries {
  final double amount;
  final String unit;
  final String label;
  final charts.Color barColor;

  MacroSeries({this.amount, this.unit, this.label, this.barColor});
}