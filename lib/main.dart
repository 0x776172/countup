import 'package:countup/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RootRestorationScope(
    restorationId: 'root',
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      restorationScopeId: 'app',
      home: HomeScreen(),
    );
  }
}
