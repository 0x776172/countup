import 'package:countup/custom/record.dart';
import 'package:countup/custom/title_container.dart';
import 'package:countup/data/date_controller.dart';
import 'package:countup/data/ui_controller.dart';
import 'package:countup/design/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final ScreenController uiController = Get.put(ScreenController());
  final DateController dateController = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BlueTheme.dark,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Obx(
              () => TitleContainer(
                title: uiController.title.value,
                radiusValue: uiController.radius.value,
                height: uiController.height.value,
              ),
            ),
            Obx(() {
              return uiController.currIndex.value == 0
                  ? RecordScreen(
                      currTime: dateController.time.value,
                      lastTime: dateController.timeHistory.value,
                    )
                  : const Text('data');
            }),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: ColorStyle.baseColor,
            selectedItemColor: ColorStyle.white,
            currentIndex: uiController.currIndex.value,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'History',
                icon: Icon(Icons.history),
              ),
            ],
            onTap: (int currentIndex) {
              uiController.updateNavigationBar(currentIndex);
              switch (currentIndex) {
                case 1:
                  uiController.updateContainer(IndexWidget.history);
                  break;
                default:
                  uiController.updateContainer(IndexWidget.home);
              }
            },
          ),
        ),
      ),
    );
  }
}
