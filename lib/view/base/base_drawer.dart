import 'package:flutter/material.dart';

class POSDrawerController extends ValueNotifier<Widget> {
  final GlobalKey<ScaffoldState> key;
  POSDrawerController(this.key) : super(const SizedBox.shrink());

  void openDrawer(Widget drawer) {
    value = drawer;
    key.currentState!.openEndDrawer();
  }

  void closeDrawer() {
    key.currentState!.closeEndDrawer();
  }
}
