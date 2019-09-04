import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  @override
  _PlanCreatorScreenState createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Plans'),
      ),
      body: Column(children: <Widget>[
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ]),
    );
  }

  Widget _buildListCreator() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Theme.of(context).cardColor,
          elevation: 10,
          child: TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: 'Add a plan', contentPadding: EdgeInsets.all(20)),
              onEditingComplete: addPlan),
        ));
  }

  Widget _buildMasterPlans() {
    final plans = PlanProvider.of(context).plans;

    if (plans.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.note, size: 100, color: Colors.grey),
            Text('You do not have any plans yet.',
                style: Theme.of(context).textTheme.headline)
          ]);
    }

    return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Dismissible(
            key: ValueKey(plan),
            background: Container(
              color: Colors.red,
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              final controller = PlanProvider.of(context);
              controller.deletePlan(plan);
              setState(() {});
            },
            child: ListTile(
                title: Text(plan.name),
                subtitle: Text(plan.completenessMessage),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PlanScreen(plan: plan)));
                }),
          );
        });
  }

  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }

    final controller = PlanProvider.of(context);
    controller.addNewPlan(text);

    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }
}
