import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartdust/models/month_type.dart';
import 'package:smartdust/models/sensor_type.dart';
import 'package:smartdust/themes/colors.dart';
import 'package:smartdust/widgets/default_appbar.dart';
import 'package:smartdust/widgets/default_button.dart';
import 'package:smartdust/widgets/line_chart_widget.dart';

class AnalysisScreen extends StatefulWidget {
  static String id = 'analysis-screen';
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final List<FlSpot> avgTempeSpots = [
    FlSpot(0, 28), // Mon
    FlSpot(1, 30), // Tue
    FlSpot(2, 31), // Wed
    FlSpot(3, 29), // Thu
    FlSpot(4, 32), // Fri
    FlSpot(5, 33), // Sat
    FlSpot(6, 31), // Sun
  ];

  final List<FlSpot> maxTempSpots = [
    FlSpot(0, 35),
    FlSpot(1, 34),
    FlSpot(2, 36),
    FlSpot(3, 33),
    FlSpot(4, 37),
    FlSpot(5, 36),
    FlSpot(6, 34),
  ];

  final List<FlSpot> minTempSpots = [
    FlSpot(0, 24),
    FlSpot(1, 22),
    FlSpot(2, 21),
    FlSpot(3, 24),
    FlSpot(4, 23),
    FlSpot(5, 20),
    FlSpot(6, 25),
  ];

  SensorType? selectedSensor = SensorType.temperature;
  MonthType? selectedMonth = MonthType.july;

  void _selectSensor(SensorType sensor) {
    setState(() {
      selectedSensor = sensor;
    });
  }

  void _selectMonth(MonthType month) {
    setState(() {
      selectedMonth = month;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray25,
      appBar: DefaultAppBar(title: 'Data Analysis', isHome: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DefaultButton(
                    content: 'Temperature',
                    onPressed: () => _selectSensor(SensorType.temperature),
                    width: 120,
                    isEnable: selectedSensor == SensorType.temperature,
                  ),
                  DefaultButton(
                    content: 'Moisture',
                    onPressed: () => _selectSensor(SensorType.moisture),
                    width: 120,
                    isEnable: selectedSensor == SensorType.moisture,
                  ),
                  DefaultButton(
                    content: 'Sunlight',
                    onPressed: () => _selectSensor(SensorType.sunlight),
                    isEnable: selectedSensor == SensorType.sunlight,
                    width: 120,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Center(
                child: DefaultButton(
                  content: 'This week',
                  onPressed: () {},
                  width: 200,
                  height: 52,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DefaultButton(
                    content: 'June',
                    onPressed: () => _selectMonth(MonthType.june),
                    width: 120,
                    height: 88,
                    isEnable: selectedMonth == MonthType.june,
                  ),
                  SizedBox(width: 12.0),
                  DefaultButton(
                    content: 'July',
                    onPressed: () => _selectMonth(MonthType.july),
                    width: 120,
                    height: 88,
                    isEnable: selectedMonth == MonthType.july,
                  ),
                  SizedBox(width: 12.0),
                  DefaultButton(
                    content: 'August',
                    onPressed: () => _selectMonth(MonthType.august),
                    width: 120,
                    height: 88,
                    isEnable: selectedMonth == MonthType.august,
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                'Data Graph',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.0),
              LineChartWidget(
                avgTemperatureSpots: avgTempeSpots,
                minTemperatureSpots: minTempSpots,
                maxTemperatureSpots: maxTempSpots,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
