import 'package:master_plan/repositories/repository.dart';

class InMemoryCache implements Repository {
  final _storage = Map<int, Model>();

  @override
  Model create() {
    final ids = _storage.keys.toList()..sort();
    final id = (ids.last ?? 0) + 1;

    final model = Model(id: id);
    _storage[id] = model;
    return model;
  }

  @override
  Model get(int id) {
    return _storage[id];
  }

  @override
  List<Model> getAll() {
    return _storage.values.toList(growable: false);
  }

  @override
  void update(Model item) {
    _storage[item.id] = item;
  }

  @override
  void delete(Model item) {
    _storage.remove(item.id);
  }

  @override
  void clear() {
    _storage.clear();
  }
}
