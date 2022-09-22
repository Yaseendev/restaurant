import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StatCard extends StatelessWidget {
  final num precentage;
  final Color color;
  final String lable;
  const StatCard({
    Key? key,
    required this.precentage,
    required this.color,
    this.lable = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                interval: 10,
                startAngle: 0,
                endAngle: 360,
                axisLineStyle: AxisLineStyle(thickness: 10),
                minimum: 0,
                maximum: 100,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: precentage.toDouble(),
                    color: color,
                    endWidth: 10,
                    startWidth: 10,
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text('$precentage%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    angle: 270,
                    positionFactor: 0.2,
                  )
                ],
                showLabels: false,
                showTicks: false,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          lable,
          //  style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
