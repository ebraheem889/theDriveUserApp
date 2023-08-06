import 'dart:async';
import 'package:flutter/material.dart';

class CountDownController extends ValueNotifier<int> {
  final Duration initTime;
  Timer? _timer;
  CountDownController(this.initTime) : super(initTime.inSeconds);
  /// Starts the count down.
  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
      super.value = initTime.inSeconds;
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (value == 0) {
          timer.cancel();
          return;
        } else {
          super.value = value - 1;
        }
      },
    );
  }
  /// Discards any resources used by the object. After this is called, the
  /// object is not in a usable state and should be discarded (calls to
  /// [addListener] will throw after the object is disposed).
  ///
  /// This method should only be called by the object's owner.
  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }
  /// The remaining time in seconds.
  @override
  int get value => super.value;
  /// Calling this will NOT set the value of `this`.
  @override
  @protected
  set value(int newValue) {
    //! prevent any one but the object it self from changing the value.
    // super.value = newValue;
    throw Exception('You cannot set the value of this controller.');
  }
  /// The remaining time formatted in `00:00`.
  String get formattedTime {
    final sec = value % 60;
    final min = (value / 60).floor();
    final String minute = min.toString().length <= 1 ? '0$min' : '$min';
    final String second = sec.toString().length <= 1 ? '0$sec' : '$sec';
    return '$minute : $second';
  }
  bool get isTimerFinish => value == 0;
}







