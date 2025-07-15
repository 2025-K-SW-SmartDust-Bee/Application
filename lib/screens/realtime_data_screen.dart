import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartdust/themes/colors.dart';
import 'package:smartdust/widgets/default_appbar.dart';

class RealtimeDataScreen extends StatefulWidget {
  final String nodeName;

  const RealtimeDataScreen({super.key, required this.nodeName});

  @override
  State<RealtimeDataScreen> createState() => _RealtimeDataScreenState();
}

class _RealtimeDataScreenState extends State<RealtimeDataScreen> {
  final List<SensorDataRow> _data = [];
  Timer? _timer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _startMockData();
  }

  void _startMockData() {
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      final now = TimeOfDay.now();
      final time =
          "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

      final temperature = 25 + _random.nextInt(10); // 25~34
      final moisture = 5 + _random.nextInt(30); // 5~34
      final sunlight = 20 + _random.nextInt(60); // 20~79

      final newRow = SensorDataRow(
        time: time,
        temperature: temperature,
        moisture: moisture,
        sunlight: sunlight,
      );

      setState(() {
        _data.insert(0, newRow);
        if (_data.length > 50) _data.removeLast();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: const [
          Expanded(child: Text('TIME', style: _headerStyle)),
          Expanded(child: Text('TEMP', style: _headerStyle)),
          Expanded(child: Text('MOIST', style: _headerStyle)),
          Expanded(child: Text('SUN', style: _headerStyle)),
          Expanded(child: Text('STATUS', style: _headerStyle)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray25,
      appBar: DefaultAppBar(title: widget.nodeName),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final row = _data[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(row.time, style: _cellStyle)),
                      Expanded(
                        child: Text("${row.temperature}°", style: _cellStyle),
                      ),
                      Expanded(
                        child: Text("${row.moisture}%", style: _cellStyle),
                      ),
                      Expanded(
                        child: Text("${row.sunlight}%", style: _cellStyle),
                      ),
                      Expanded(
                        child: Text(
                          row.status,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: row.isWarning ? Colors.red : Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

const TextStyle _headerStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

const TextStyle _cellStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

class SensorDataRow {
  final String time;
  final int temperature;
  final int moisture;
  final int sunlight;

  SensorDataRow({
    required this.time,
    required this.temperature,
    required this.moisture,
    required this.sunlight,
  });

  bool get isWarning {
    return temperature > 32 || moisture < 10 || sunlight > 70;
  }

  String get status => isWarning ? 'Warning' : 'Normal';
}
