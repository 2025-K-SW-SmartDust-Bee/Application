import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartdust/themes/colors.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    super.key,
    required this.avgTemperatureSpots,
    required this.minTemperatureSpots,
    required this.maxTemperatureSpots,
  });

  final List<FlSpot> avgTemperatureSpots;
  final List<FlSpot> minTemperatureSpots;
  final List<FlSpot> maxTemperatureSpots;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 440.0,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      '${value.toInt()}°',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  final text = switch (value.toInt()) {
                    0 => 'Mon',
                    1 => 'Tue',
                    2 => 'Wed',
                    3 => 'Thu',
                    4 => 'Fri',
                    5 => 'Sat',
                    6 => 'Sun',
                    _ => '',
                  };
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          gridData: FlGridData(
            drawHorizontalLine: false,
            drawVerticalLine: true,
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 60,
          lineBarsData: [
            LineChartBarData(
              spots: maxTemperatureSpots,
              isCurved: true,
              color: Colors.redAccent,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.main300.withAlpha(60),
              ),
            ),
            LineChartBarData(
              spots: avgTemperatureSpots,
              isCurved: true,
              color: AppColors.main300,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.main300.withAlpha(60),
              ),
            ),
            LineChartBarData(
              spots: minTemperatureSpots,
              isCurved: true,
              color: AppColors.gray200,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.main300.withAlpha(60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
