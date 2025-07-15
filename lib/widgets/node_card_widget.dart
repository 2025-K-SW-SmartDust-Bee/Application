import 'package:flutter/material.dart';
import 'package:smartdust/components/data_component.dart';
import 'package:smartdust/models/sensor_type.dart';
import 'package:smartdust/screens/realtime_data_screen.dart';
import 'package:smartdust/themes/colors.dart';

class NodeCardWidget extends StatelessWidget {
  final String name;
  final int temparature;
  final int moisture;
  final int sunlight;

  const NodeCardWidget({
    super.key,
    required this.name,
    required this.temparature,
    required this.moisture,
    required this.sunlight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RealtimeDataScreen(nodeName: name)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                color: AppColors.gray800,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40.0),
            DataComponent(data: temparature, type: SensorType.temperature),
            DataComponent(data: moisture, type: SensorType.moisture),
            DataComponent(data: sunlight, type: SensorType.sunlight),
          ],
        ),
      ),
    );
  }
}
