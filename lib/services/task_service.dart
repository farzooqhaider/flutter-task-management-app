import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';


class TaskService {
  final String uid;
  TaskService({required this.uid});

  String get _tasksKey => 'tasks_$uid';

  Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString(_tasksKey);
    if (tasksJson == null) return [];

    final List<dynamic> taskList = jsonDecode(tasksJson);
    return taskList
        .map((item) => Task.fromMap(Map<String, dynamic>.from(item)))
        .toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksJson = jsonEncode(tasks.map((t) => t.toMap()).toList());
    await prefs.setString(_tasksKey, tasksJson);
  }
}
