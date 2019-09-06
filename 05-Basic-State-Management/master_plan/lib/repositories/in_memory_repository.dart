import 'package:master_plan/repositories/repository.dart';

class InMemoryRepository implements Repository {
  final Map storage = Map<int, Model>();

  @override
  Model create() {
    final ids = storage.keys.toList()..sort();
    final id = (ids.last ?? 0) + 1;

    final model = Model(id: id);
    storage[id] = model;
    return model;
  }

  @override
  Model get(int id) {
    return storage[id];
  }

  @override
  List<Model> getAll() {
    return storage.values.toList(growable: false);
  }

  @override
  void update(Model item) {
    storage[item.id] = item;
  }

  @override
  void delete(Model item) {
    storage.remove(item.id);
  }

  @override
  void clear() {
    storage.clear();
  }
}
