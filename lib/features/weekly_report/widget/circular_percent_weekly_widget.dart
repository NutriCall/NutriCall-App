import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentWeelyWidget extends HookConsumerWidget {
  final List<double> percentages;
  final List<Color> progressColors;
  final Color backgroundColor;

  const CircularPercentWeelyWidget({
    super.key,
    required this.percentages,
    required this.progressColors,
    required this.backgroundColor,
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
}
