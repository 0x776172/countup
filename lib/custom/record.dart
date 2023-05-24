import 'package:countup/data/date_controller.dart';
import 'package:countup/design/style.dart';
import 'package:countup/models/time_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordScreen extends StatelessWidget {
  final TimeModel currTime;
  final TimeModel lastTime;

  RecordScreen({
    super.key,
    required this.currTime,
    required this.lastTime,
  });
  final DateController _controller = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Current Streak: ${currTime.day}d ${currTime.hour}h ${currTime.minute}m ${currTime.second}s',
              style: CustomTextStyle.timeStyle,
            ),
          ),
          Text(
            'Last Streak: ${lastTime.day}d ${lastTime.hour}h ${lastTime.minute}m ${lastTime.second}s',
            style: CustomTextStyle.timeStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  ColorStyle.lightGreen,
                ),
              ),
              onPressed: () {
                _controller.resetTime();
              },
              child: Text(
                'Relapsed',
                style: TextStyle(
                  fontSize: 15,
                  color: ColorStyle.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
