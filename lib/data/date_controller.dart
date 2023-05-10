import 'dart:convert';

import 'package:countup/models/time_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DateController extends GetxController {
  static DateController get to => Get.find();
  final timeStorage = GetStorage();

  TimeModel time = TimeModel.init;
  TimeModel timeHistory = TimeModel.init;

  void updateTime() {
    var sumSecond = _timeBetweenInSeconds(time.setTime.value, DateTime.now());
    var sumMinute = (sumSecond / 60).floor();
    var sumHour = (sumMinute / 60).floor();

    time.second.value = (sumSecond % 60).toInt();
    time.minute.value = (sumMinute % 60).toInt();
    time.hour.value = (sumHour % 24).toInt();
    time.day.value = (sumHour / 24).floor();
  }

  void resetTime() {
    _resetCurrentTime();
  }

  void saveTime(String key, TimeModel value) {
    timeStorage.write(key, jsonEncode(value.toJSON()));
  }

  TimeModel getSavedTime(String key) {
    var rawTime = timeStorage.read(key);

    return rawTime != null
        ? TimeModel.fromJSON(jsonDecode(rawTime))
        : TimeModel.init;
  }

  void _resetCurrentTime() {
    _saveLastCurrentTime();
    time.second.value = 0;
    time.minute.value = 0;
    time.hour.value = 0;
    time.day.value = 0;
    time.setTime.value = DateTime.now();
  }

  void _saveLastCurrentTime() {
    timeHistory.second.value = time.second.value;
    timeHistory.minute.value = time.minute.value;
    timeHistory.hour.value = time.hour.value;
    timeHistory.day.value = time.day.value;
  }

  int _timeBetweenInSeconds(DateTime from, DateTime to) {
    var timeDiff = 0;
    timeDiff = to.difference(from).inSeconds;

    return timeDiff;
  }
}
