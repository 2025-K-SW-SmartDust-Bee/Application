import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartdust/models/month_type.dart';
import 'package:smartdust/models/sensor_type.dart';
import 'package:smartdust/themes/colors.dart';
import 'package:smartdust/widgets/default_appbar.dart';
import 'package:smartdust/widgets/node_card.dart';

class TodayScreen extends StatefulWidget {
  static String id = 'analysis-screen';
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
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
      appBar: DefaultAppBar(title: 'Realtime Data', isHome: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Realtime Data',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.0),
              NodeCard(
                name: 'NODE1945241',
                temparature: 28,
                moisture: 14,
                sunlight: 45,
              ),
              SizedBox(height: 16.0),
              NodeCard(
                name: 'NODE4553912',
                temparature: 29,
                moisture: 16,
                sunlight: 49,
              ),
              SizedBox(height: 16.0),
              NodeCard(
                name: 'NODE3095723',
                temparature: 30,
                moisture: 7,
                sunlight: 60,
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
