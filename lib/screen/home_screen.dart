import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with RestorationMixin<HomeScreen> {
  late Timer timer;
  late DateTime currTime;
  final RestorableDateTime _setTime = RestorableDateTime(DateTime.now());
  final RestorableInt _timeDiff = RestorableInt(0);
  final RestorableInt _s = RestorableInt(0);
  final RestorableInt _m = RestorableInt(0);
  final RestorableInt _h = RestorableInt(0);
  final RestorableInt _d = RestorableInt(0);
  final RestorableInt _ls = RestorableInt(0);
  final RestorableInt _lm = RestorableInt(0);
  final RestorableInt _lh = RestorableInt(0);
  final RestorableInt _ld = RestorableInt(0);

  @override
  void initState() {
    super.initState();
    _setTime.value = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _update();
    });
  }

  void _update() {
    setState(() {
      _timeDiff.value = timeBetweenInSeconds(_setTime.value, DateTime.now());
      var canIncrement = _timeDiff.value % 61 == 60;
      _s.value = _timeDiff.value % 60;
      if (canIncrement) {
        if (_m.value < 59) {
          _m.value += 1;
          return;
        }
        _m.value = 0;
        if (_h.value < 23) {
          _h.value += 1;
          return;
        }
        _h.value = 0;
        _d.value += 1;
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
      _ls.value = _s.value;
      _lm.value = _m.value;
      _lh.value = _h.value;
      _ld.value = _d.value;
      _setTime.value = DateTime.now();
      _m.value = _h.value = _d.value = 0;
    });
  }

  @override
  String get restorationId => 'countUpTime';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_s, 'second');
    registerForRestoration(_m, 'minute');
    registerForRestoration(_h, 'hour');
    registerForRestoration(_d, 'day');
    registerForRestoration(_ls, 'lastSecond');
    registerForRestoration(_lm, 'lastMinute');
    registerForRestoration(_lh, 'lastHour');
    registerForRestoration(_ld, 'lastDay');
    registerForRestoration(_timeDiff, 'timeDiff');
    registerForRestoration(_setTime, 'setTime');
  }

  @override
  void dispose() {
    _s.dispose();
    _m.dispose();
    _h.dispose();
    _d.dispose();
    _ls.dispose();
    _lm.dispose();
    _lh.dispose();
    _ld.dispose();

    _timeDiff.dispose();
    _setTime.dispose();
    super.dispose();
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
              'Current Streak: ${_d.value}d ${_h.value}h ${_m.value}m ${_s.value}s',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Last Streak: ${_ld.value}d ${_lh.value}h ${_lm.value}m ${_ls.value}s',
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
