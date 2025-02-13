import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends HookConsumerWidget {
  final List<List<double>> yValues;
  final List<Color> colors;

  const BarChartWidget({
    super.key,
    required this.yValues,
    required this.colors,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> xLabels = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']; 

    return Scaffold(
      body: SizedBox(
        width: 310,
        height: 150,
        child: SfCartesianChart(
          series: List.generate(
            colors.length,
            (index) => StackedColumnSeries<String, String>(
              dataSource: xLabels,
              xValueMapper: (String day, int i) => day,
              yValueMapper: (String day, int i) => yValues[i][index],
              color: colors[index],
            ),
          ),
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 1),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            labelStyle: GoogleFonts.poppins(
              fontSize: 9, 
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 100,
            interval: 20,
            majorGridLines: const MajorGridLines(width: 1),
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(width: 0),
            labelStyle: GoogleFonts.poppins(
              fontSize: 0, 
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          plotAreaBorderWidth: 0,
        ),
      ),
    );
  }
}


class ChartData{
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}