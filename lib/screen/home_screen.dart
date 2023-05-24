// import 'dart:async';

// import 'package:countup/custom/button_history.dart';
// import 'package:countup/data/date_controller.dart';
// import 'package:countup/design/style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late Timer timer;
//   final DateController controller = Get.put(DateController());

//   final double _buttonMargin = 35;
//   final double _buttonTextMargin = 10;

//   final double _textSize = 20;

//   @override
//   void initState() {
//     super.initState();
//     controller.time = controller.getSavedTime('time');
//     controller.timeHistory = controller.getSavedTime('history');
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       controller.updateTime();
//       controller.saveTime('time', controller.time);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorStyle.screenBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: ColorStyle.baseColor,
//         elevation: 0,
//         title: const Text('Count Your Time'),
//         actions: [
//           Container(
//             margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
//             child: const HistoryButton(),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Obx(
//               () => Text(
//                 'Current Streak: ${controller.time.day}d ${controller.time.hour}h ${controller.time.minute}m ${controller.time.second}s',
//                 style: TextStyle(fontSize: _textSize),
//               ),
//             ),
//             Obx(
//               () => Text(
//                 'Last Streak: ${controller.timeHistory.day}d ${controller.timeHistory.hour}h ${controller.timeHistory.minute}m ${controller.timeHistory.second}s',
//                 style: TextStyle(fontSize: _textSize),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(_buttonMargin),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor:
//                       MaterialStateProperty.all(ColorStyle.baseColor),
//                 ),
//                 onPressed: () {
//                   // await showModalBottomSheet(
//                   //   context: context,
//                   //   builder: (context) => Container(
//                   //     margin: const EdgeInsets.all(5),
//                   //     child: Column(
//                   //       mainAxisSize: MainAxisSize.min,
//                   //       children: [
//                   //         const Text('data'),
//                   //         ElevatedButton(
//                   //             onPressed: () async {
//                   //               await showTimePicker(
//                   //                   context: context,
//                   //                   initialTime: TimeOfDay.now(),
//                   //                   initialEntryMode:
//                   //                       TimePickerEntryMode.dialOnly);
//                   //             },
//                   //             child: const Text('Test'))
//                   //       ],
//                   //     ),
//                   //   ),
//                   // );

//                   controller.resetTime();
//                   controller.saveTime('history', controller.timeHistory);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.all(_buttonTextMargin),
//                   child: Text(
//                     'Relapsed',
//                     style: TextStyle(fontSize: _textSize),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
