//import 'package:flutter/material.dart';
//import 'package:master_plan/models/data_layer.dart';
//import 'package:master_plan/plan_provider.dart';
//import 'package:master_plan/views/plan_screen.dart';
//
//class PlanCreatorScreen extends StatefulWidget {
//  @override
//  _PlanCreatorScreenState createState() => _PlanCreatorScreenState();
//}
//
//class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
//  final textController = TextEditingController();
//
//  @override
//  void dispose() {
//    textController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Master Plans'),
//      ),
//      body: Column(children: <Widget>[
//        _buildListCreator(),
//        Expanded(child: _buildMasterPlans())
//      ]),
//    );
//  }
//
//  Widget _buildListCreator() {
//    return Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: Material(
//          color: Theme.of(context).cardColor,
//          elevation: 10,
//          child: TextField(
//              controller: textController,
//              decoration: InputDecoration(
//                  labelText: 'Add a plan', contentPadding: EdgeInsets.all(20)),
//              onEditingComplete: addPlan),
//        ));
//  }
//
//  Widget _buildMasterPlans() {
//    final plans = PlanProvider.of(context);
//
//    return ListView.builder(
//        itemCount: plans.length,
//        itemBuilder: (context, index) {
//          final plan = plans[index];
//          return ListTile(
//              title: Text(plan.name),
//              subtitle: Text(
//                  '${plan.completeCount} out of ${plan.tasks.length} tasks'),
//              onTap: () {
//                Navigator.of(context).push(MaterialPageRoute(
//                  builder: (_) => PlanScreen(plan: plan),
//                ));
//              });
//        });
//  }
//
//  void addPlan() {
//    final text = textController.text;
//    if (text.isEmpty) {
//      return;
//    }
//
//    final plan = Plan()..name = text;
//    PlanProvider.of(context).add(plan);
//    textController.clear();
//    FocusScope.of(context).requestFocus(FocusNode());
//    setState(() {});
//  }
//}
