import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Dialogs {
  // ignore: prefer_final_fields
  static Completer _completer = Completer();

  /// Shows a pre-configured loading.
  static void showLoading() {
    dismiss();
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..contentPadding = const EdgeInsets.all(20)
      ..maskType = EasyLoadingMaskType.black
      ..backgroundColor = Colors.white.withOpacity(0.1)
      ..indicatorColor = Color(0xFF06BFB6)
      ..textColor = Colors.white
      ..userInteractions = false
      ..dismissOnTap = false;

    EasyLoading.show();
  }

  /// Dismisses any dialog on the screen.
  ///
  /// Note that if you wan't to dismiss somthing only to display
  /// a message Immediately this will be called automatically.
  static void dismiss() {
    if (!_completer.isCompleted) {
      _completer.complete();
      _completer = Completer();
    }
    EasyLoading.dismiss();
  }

  static void showCustomDialog(BuildContext context, Widget content,
      {Completer? completer, bool dismissible = true}) {
    // we create this controller to be able to dismiss the pop up without ever complete it.
    Completer? c = Completer();

    dismiss();
    context.showFlashDialog(
      backgroundColor: Colors.transparent,
      barrierDismissible: dismissible,
      dismissCompleter:
          completer ?? (dismissible ? c : completer ?? _completer),
      transitionDuration: const Duration(milliseconds: 200),
      content: content,
    );
  }

  /// Shows a pre-configured toast.
  static void showToast(String message, BuildContext context) {
    dismiss();
    context.showToast(message);
  }
}
