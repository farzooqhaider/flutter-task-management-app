import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../services/task_service.dart';

enum TaskFilter { all, pending, done }

class TaskProvider extends ChangeNotifier {
  TaskService? _service;
  List<Task> _tasks = [];
  bool _isLoading = true;
  TaskFilter _filter = TaskFilter.all;

  List<Task> get tasks => List.unmodifiable(_tasks);
  bool get isLoading => _isLoading;
  TaskFilter get filter => _filter;

  int get pendingCount => _tasks.where((t) => !t.isCompleted).length;
  int get doneCount => _tasks.where((t) => t.isCompleted).length;
  int get totalCount => _tasks.length;

  List<Task> get filteredTasks {
    switch (_filter) {
      case TaskFilter.pending:
        return _tasks.where((t) => !t.isCompleted).toList();
      case TaskFilter.done:
        return _tasks.where((t) => t.isCompleted).toList();
      case TaskFilter.all:
        return _tasks;
    }
  }

  Future<void> loadForUser(String uid) async {
    _isLoading = true;
    notifyListeners();

    _service = TaskService(uid: uid);
    _tasks = await _service!.loadTasks();

    _isLoading = false;
    notifyListeners();
  }

  /// Clears in-memory state on sign-out so the next user never sees a
  /// flash of the previous user's tasks.
  void clear() {
    _tasks = [];
    _service = null;
    _isLoading = true;
    notifyListeners();
  }

  void setFilter(TaskFilter filter) {
    if (_filter == filter) return;
    _filter = filter;
    notifyListeners();
  }

  Future<void> addTask({required String title, String? description}) async {
    final task = Task(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      title: title.trim(),
      description: (description == null || description.trim().isEmpty)
          ? null
          : description.trim(),
      createdAt: DateTime.now(),
    );
    _tasks = [..._tasks, task];
    notifyListeners();
    await _persist();
  }

  Future<void> deleteTask(String id) async {
    _tasks = _tasks.where((t) => t.id != id).toList();
    notifyListeners();
    await _persist();
  }

  Future<void> toggleTask(String id) async {
    _tasks = _tasks
        .map((t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t)
        .toList();
    notifyListeners();
    await _persist();
  }

  Future<void> _persist() async {
    // _service is only null before a user has been loaded, which shouldn't
    // happen once the UI is mutating tasks - guard defensively anyway.
    await _service?.saveTasks(_tasks);
  }
}
