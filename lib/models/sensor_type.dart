enum SensorType { temperature, moisture, sunlight }

extension SensorTypeExtension on SensorType {
  String get label {
    switch (this) {
      case SensorType.temperature:
        return 'TEMPERATURE';
      case SensorType.moisture:
        return 'MOISTURE';
      case SensorType.sunlight:
        return 'SUNLIGHT';
    }
  }

  String get unit {
    switch (this) {
      case SensorType.temperature:
        return '°';
      default:
        return '%';
    }
  }
}
