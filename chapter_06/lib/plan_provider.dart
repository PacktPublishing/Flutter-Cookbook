import 'package:flutter/material.dart';
import 'controllers/plan_controller.dart';

class PlanProvider extends InheritedWidget {
  final _controller = PlanController();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  static PlanController of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>()
        as PlanProvider;
    return provider._controller;
  }
}
