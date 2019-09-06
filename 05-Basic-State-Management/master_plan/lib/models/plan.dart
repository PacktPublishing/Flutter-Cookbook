import 'package:master_plan/models/task.dart';
import 'package:master_plan/repositories/repository.dart';

class Plan {
  final int id;
  String name = '';
  List<Task> tasks = [];

  Plan(this.id, this.name);

  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completeCount out of ${tasks.length} tasks';

  Plan.fromModel(Model model)
      : id = model.id,
        name = model?.data['name'],
        tasks = model?.data['task']
                ?.map<Task>((taskModel) => Task.fromModel(taskModel))
                ?.toList() ??
            <Task>[];

  Model toModel() => Model(id: id, data: {
        'name': name,
        'tasks': tasks.map((task) => task.toModel()).toList()
      });
}
