import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  final textControllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Plan'),
      ),
      body: ListView.builder(
        itemCount: plan.tasks.length,
        itemBuilder: (context, index) =>
            _buildTaskTile(plan.tasks[index], textControllers[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            plan.tasks.add(Task());
            textControllers.add(TextEditingController());
          });
        },
      ),
    );
  }

  Widget _buildTaskTile(Task task, TextEditingController controller) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              task.complete = selected;
            });
          }),
      title: TextField(
        controller: controller,
        onChanged: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
