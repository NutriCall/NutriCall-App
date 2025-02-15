import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentWeelyWidget extends HookConsumerWidget {
  final List<double> percentages;
  final List<Color> progressColors;
  final Color backgroundColor;
  final List<String> labels;

  const CircularPercentWeelyWidget({
    super.key,
    required this.percentages,
    required this.progressColors,
    required this.backgroundColor,
    required this.labels,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularPercentIndicator(
          radius: 80.0,
          lineWidth: 45.0,
          percent: 1.0, 
          backgroundColor: backgroundColor,
          progressColor: backgroundColor,
        ),
        
        ..._buildSegmentedProgress(),
        ..._buildLabels(),
      ],
    );
  }

  List<Widget> _buildSegmentedProgress() {
    List<Widget> progressSegments = [];
    double startAngle = 0.0;
    
    for (int i = 0; i < percentages.length; i++) {
      progressSegments.add(
        Positioned.fill(
          child: RotatedBox(
            quarterTurns: 3, 
            child: CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 45.0,
              percent: percentages[i],
              backgroundColor: Colors.transparent,
              progressColor: progressColors[i],
              startAngle: startAngle, 
            ),
          ),
        ),
      );

      startAngle += percentages[i] * 360;
    }

    return progressSegments;
  }

  List<Widget> _buildLabels() {
    List<Widget> labelWidgets = [];
    double startAngle = -180.0; 
    double radius = 105.0; 

    for (int i = 0; i < percentages.length; i++) {
      double midAngle = startAngle + (percentages[i] * 180); 
      double radian = (midAngle * pi) / 180; 

      double x = cos(radian) * radius;
      double y = sin(radian) * radius;

      labelWidgets.add(
        Transform.translate(
          offset: Offset(x, y),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                labels[i],
                style:  GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "${(percentages[i] * 100).toStringAsFixed(0)}%",
                style:  GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );

      startAngle += percentages[i] * 360;
    }

    return labelWidgets;
  }
}
