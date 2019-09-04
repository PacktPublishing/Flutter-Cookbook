import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/models/plan.dart';

class PlanController {
  final _plans = <Plan>[];

  List<Plan> get plans => List.of(_plans, growable: false);

  void addNewPlan(String name) {
    name = _checkForDuplicates(_plans.map((plan) => plan.name), name);

    final plan = Plan()..name = name;
    _plans.add(plan);
  }

  void deletePlan(Plan plan) {
    _plans.remove(plan);
  }

  void createNewTask(Plan plan, String description) {
    description = _checkForDuplicates(
        plan.tasks.map((task) => task.description), description);

    final task = Task()..description = description;
    plan.tasks.add(task);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
  }

  String _checkForDuplicates(Iterable<String> items, text) {
    final duplicatedCount = items.where(((item) => item.contains(text))).length;
    if (duplicatedCount > 0) {
      text += ' ${duplicatedCount + 1}';
    }

    return text;
  }
}
