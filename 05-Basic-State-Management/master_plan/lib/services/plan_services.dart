import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/models/plan.dart';
import 'package:master_plan/repositories/in_memory_repository.dart';
import 'package:master_plan/repositories/repository.dart';

class PlanServices {
  final Repository repository = InMemoryRepository();

  Plan createPlan(String name) {
    final model = repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan) {
    repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    repository.delete(plan.toModel());
  }

  List<Plan> getAllPlans() {
    return repository
        .getAll()
        .map<Plan>((model) => Plan.fromModel(model))
        .toList();
  }

  void addTask(Plan plan, String description) {
    final id = plan.tasks.last?.id ?? 0 + 1;
    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
    savePlan(plan);
  }
}
