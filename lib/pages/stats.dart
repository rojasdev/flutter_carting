import 'package:flutter/material.dart';
import 'charts.dart';

class StatPage extends StatelessWidget {
  const StatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: SimpleTimeSeriesChart.withSampleData(),
            ),
          ),
        ),
      ),
    );
  }
}
