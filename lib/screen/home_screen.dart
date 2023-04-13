import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RestorationMixin {
  late Timer timer;
  late DateTime currTime;
  final RestorableDateTime setTime = RestorableDateTime(DateTime.now());
  final RestorableInt timeDiff = RestorableInt(0);
  final RestorableInt s = RestorableInt(0);
  final RestorableInt m = RestorableInt(0);
  final RestorableInt h = RestorableInt(0);
  final RestorableInt d = RestorableInt(0);
  final RestorableInt ls = RestorableInt(0);
  final RestorableInt lm = RestorableInt(0);
  final RestorableInt lh = RestorableInt(0);
  final RestorableInt ld = RestorableInt(0);

  @override
  void initState() {
    super.initState();
    setTime.value = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _update();
    });
  }

  void _update() {
    setState(() {
      timeDiff.value = timeBetweenInSeconds(setTime.value, DateTime.now());
      var canIncrement = timeDiff.value % 61 == 60;
      s.value = timeDiff.value % 60;
      if (canIncrement) {
        if (m.value < 59) {
          m.value += 1;
          return;
        }
        m.value = 0;
        if (h.value < 23) {
          h.value += 1;
          return;
        }
        h.value = 0;
        d.value += 1;
      }
    });
  }

  int timeBetweenInSeconds(DateTime from, DateTime to) {
    var timeDiff = 0;
    timeDiff = to.difference(from).inSeconds;

    return timeDiff;
  }

  void _updateSetTime() {
    setState(() {
      ls.value = s.value;
      lm.value = m.value;
      lh.value = h.value;
      ld.value = d.value;
      setTime.value = DateTime.now();
      m.value = h.value = d.value = 0;
    });
  }

  @override
  void dispose() {
    s.dispose();
    m.dispose();
    h.dispose();
    d.dispose();
    ls.dispose();
    lm.dispose();
    lh.dispose();
    ld.dispose();

    timeDiff.dispose();
    setTime.dispose();
    super.dispose();
  }

  @override
  String get restorationId => 'countUpTime';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(s, 'second');
    registerForRestoration(m, 'minute');
    registerForRestoration(h, 'hour');
    registerForRestoration(d, 'day');
    registerForRestoration(ls, 'lastSecond');
    registerForRestoration(lm, 'lastMinute');
    registerForRestoration(lh, 'lastHour');
    registerForRestoration(ld, 'lastDay');
    registerForRestoration(timeDiff, 'timeDiff');
    registerForRestoration(setTime, 'setTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Your Time'),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: const Icon(Icons.history),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Current Streak: ${d.value}d ${h.value}h ${m.value}m ${s.value}s',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Last Streak: ${ld.value}d ${lh.value}h ${lm.value}m ${ls.value}s',
              style: const TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                onPressed: () {
                  _updateSetTime();
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Relapsed',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
