import 'package:get/get.dart';

class TimeModel {
  late RxInt day;
  late RxInt hour;
  late RxInt minute;
  late RxInt second;
  late Rx<DateTime> setTime;

  static TimeModel init = TimeModel(0, 0, 0, 0, DateTime.now());

  TimeModel(int day, int hour, int minute, int second, DateTime setTime) {
    this.day = day.obs;
    this.hour = hour.obs;
    this.minute = minute.obs;
    this.second = second.obs;
    this.setTime = setTime.obs;
  }

  Map<String, dynamic> toJSON() {
    return {
      'day': day.value,
      'hour': hour.value,
      'minute': minute.value,
      'second': second.value,
      'setTime': setTime.value.toString(),
    };
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
