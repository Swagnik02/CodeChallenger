import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int testDuration;
  final Function() onTimerEnd;

  const CountdownTimer({
    Key? key,
    required this.testDuration,
    required this.onTimerEnd,
  }) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  int _secondsLeft = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsLeft = widget.testDuration * 60;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
        widget.onTimerEnd();
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = (_secondsLeft / 60).floor();
    int seconds = _secondsLeft % 60;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$minutes:${seconds.toString().padLeft(2, '0')}  ',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
