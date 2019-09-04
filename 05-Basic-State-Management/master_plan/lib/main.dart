import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_creator_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: PlanCreatorScreen(),
      ),
    );
  }
}
