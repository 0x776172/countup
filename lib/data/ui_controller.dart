// import 'package:countup/custom/record.dart';
import 'package:get/get.dart';

enum IndexWidget { home, history }

class ScreenController extends GetxController {
  late RxString title;
  late RxDouble height;
  late RxDouble radius;
  late RxInt currIndex;

  @override
  void onInit() {
    title = ''.obs;
    height = 0.0.obs;
    radius = 0.0.obs;
    currIndex = 0.obs;
    _homeContainer();
    super.onInit();
  }

  void updateNavigationBar(int index) {
    currIndex.value = index;
  }

  void _homeContainer() {
    _updateContainer(110, 30, 'Count Your Streak!');
  }

  void _historyContainer() {
    _updateContainer(75, 0, 'History');
  }

  void _updateContainer(double height, double radius, String title) {
    this.title.value = title;
    this.height.value = height;
    this.radius.value = radius;
  }

  void updateContainer(IndexWidget currIndex) {
    switch (currIndex) {
      case IndexWidget.home:
        _homeContainer();
        break;
      case IndexWidget.history:
        _historyContainer();
        break;
    }
  }
}
