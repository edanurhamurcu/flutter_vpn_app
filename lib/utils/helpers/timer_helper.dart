import 'dart:async';

class TimerHelper {
  static Timer startTimer(Duration interval, void Function() callback) {
    return Timer.periodic(interval, (_) => callback());
  }
}