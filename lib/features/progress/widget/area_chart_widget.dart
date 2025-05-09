import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaChartWidget extends StatefulWidget {
  final List<ChartData> chartData;

  const AreaChartWidget({super.key, required this.chartData});

  @override
  _AreaChartWidgetState createState() => _AreaChartWidgetState();
}

class _AreaChartWidgetState extends State<AreaChartWidget> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      height: 150,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
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
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(width: 0),
          labelStyle: GoogleFonts.poppins(
            fontSize: 9, 
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        tooltipBehavior: _tooltip,
        series: <CartesianSeries<ChartData, String>>[
          SplineAreaSeries<ChartData, String>(
            dataSource: widget.chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.darkGreen.withOpacity(0.7),
                AppColor.darkGreen.withOpacity(0.4),
                AppColor.darkWhite.withOpacity(0.2),
              ],
            ),
            borderColor: AppColor.darkGreen,
            borderWidth: 2,
            markerSettings: const MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              width: 6,
              height: 6,
              color: AppColor.neon,
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}


