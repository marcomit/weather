import 'package:flutter/material.dart';
import 'package:weather/components/init.dart';

final class HourlyList extends StatelessWidget {
  final Map<String, dynamic> value;
  final Map<String, dynamic> airValue;
  final DateTime day;
  final int range;

  const HourlyList(
      {super.key,
      this.range = 1,
      required this.day,
      required this.value,
      required this.airValue});

  @override
  Widget build(BuildContext context) {
    final dataLength = (value['time'] as List<dynamic>).length;
    //final airValueLength = (airValue['time'] as List<dynamic>).length;
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            for (int i = 0; i < dataLength; i++)
              if (DateTime.parse(value['time'][i]).hour % range == 0 &&
                  DateTime.parse(value['time'][i]).year == day.year &&
                  DateTime.parse(value['time'][i]).month == day.month &&
                  DateTime.parse(value['time'][i]).day == day.day)
                HourlyCard(
                    uvIndex: value['uv_index'][i].toInt(),
                    visibility: value['visibility'][i].toInt(),
                    percepita: value['apparent_temperature'][i],
                    umidity: value['relativehumidity_2m'][i].toDouble(),
                    hour: DateTime.parse(value['time'][i]).hour,
                    weathercode: value['weathercode'][i] as int,
                    temperature: value['temperature_2m'][i] as double,
                    windDirection: value['winddirection_10m'][i] as int,
                    windSpeed: value['windspeed_10m'][i] as double,
                    precipitationrobability:
                        value['precipitation_probability'][i] as int,
                    isDay: (value['is_day'][i] as int) == 1,
                    rain: value['precipitation'][i] as double)
          ],
        ));
  }
}
