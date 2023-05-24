import 'package:countup/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('id', 'ID'),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
