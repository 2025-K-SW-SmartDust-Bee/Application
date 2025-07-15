import 'package:flutter/material.dart';
import 'package:smartdust/models/sensor_type.dart';
import 'package:smartdust/themes/colors.dart';

class DataComponent extends StatelessWidget {
  final SensorType type;
  final int data;

  const DataComponent({super.key, required this.type, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        SizedBox(width: 4.0),
        Text(
          type.label,
          style: TextStyle(
            fontSize: 16.0,
            color: AppColors.gray900,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          '$data${type.unit}',
          style: TextStyle(
            fontSize: 40.0,
            color: AppColors.green300,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
