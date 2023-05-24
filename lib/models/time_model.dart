import 'dart:convert';

class TimeModel {
  late int day;
  late int hour;
  late int minute;
  late int second;
  late DateTime setTime;

  static TimeModel init = TimeModel(0, 0, 0, 0, DateTime.now());

  TimeModel(this.day, this.hour, this.minute, this.second, this.setTime);

  String toJSON() {
    var res = {
      'day': day,
      'hour': hour,
      'minute': minute,
      'second': second,
      'setTime': setTime.toString(),
    };
    return jsonEncode(res);
  }

  factory TimeModel.fromJSON(Map<String, dynamic> json) {
    int second = json['second'] ?? 0;
    int minute = json['minute'] ?? 0;
    int hour = json['hour'] ?? 0;
    int day = json['day'] ?? 0;
    DateTime setTime =
        DateTime.parse(json['setTime'] ?? '2023-05-09 11:19:16.077776');
    return TimeModel(day, hour, minute, second, setTime);
  }
}
