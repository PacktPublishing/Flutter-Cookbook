import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _plan = Plan();

  PlanProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static Plan of(BuildContext context) {
    final provider =
        context.inheritFromWidgetOfExactType(PlanProvider) as PlanProvider;
    return provider._plan;
  }
}
