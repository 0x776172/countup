import 'dart:async';
import 'dart:convert';

import 'package:countup/models/time_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DateController extends GetxController {
  static DateController get to => Get.find();
  final timeStorage = GetStorage();

  Rx<TimeModel> time = TimeModel.init.obs;
  Rx<TimeModel> timeHistory = TimeModel.init.obs;

  @override
  void onInit() {
    super.onInit();
    time.value = getSavedTime('time');
    timeHistory.value = getSavedTime('history');
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    var sumSecond = _timeBetweenInSeconds(time.value.setTime, DateTime.now());
    var sumMinute = (sumSecond / 60).floor();
    var sumHour = (sumMinute / 60).floor();

    time.value.second = (sumSecond % 60).toInt();
    time.value.minute = (sumMinute % 60).toInt();
    time.value.hour = (sumHour % 24).toInt();
    time.value.day = (sumHour / 24).floor();

    time.value = TimeModel.fromJSON(jsonDecode(time.value.toJSON()));
    saveTime('time', time.value);
  }

  void resetTime() {
    _resetCurrentTime();
  }

  void saveTime(String key, TimeModel value) {
    timeStorage.write(key, value.toJSON());
  }

  TimeModel getSavedTime(String key) {
    var rawTime = timeStorage.read(key);

    return rawTime != null
        ? TimeModel.fromJSON(jsonDecode(rawTime))
        : TimeModel.init;
  }

  void _resetCurrentTime() {
    _saveLastCurrentTime();
    time.value.second = 0;
    time.value.minute = 0;
    time.value.hour = 0;
    time.value.day = 0;
    time.value.setTime = DateTime.now();
  }

  void _saveLastCurrentTime() {
    timeHistory.value.second = time.value.second;
    timeHistory.value.minute = time.value.minute;
    timeHistory.value.hour = time.value.hour;
    timeHistory.value.day = time.value.day;
    saveTime('history', timeHistory.value);
  }

  int _timeBetweenInSeconds(DateTime from, DateTime to) {
    var timeDiff = 0;
    timeDiff = to.difference(from).inSeconds;

    return timeDiff;
  }
}
