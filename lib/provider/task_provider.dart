import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notjusttodoapp/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  UnmodifiableListView<TaskModel> get allTasks => UnmodifiableListView(_tasks);

  List<TaskModel> get completedTasks => _tasks
      .where(
        (element) => element.completed,
      )
      .toList();

  List<TaskModel> get pendingTasks => _tasks
      .where(
        (element) => !element.completed,
      )
      .toList();

  void addTask(taskName, taskDesc, taskCat) {
    _tasks.add(TaskModel(
        taskName: taskName,
        taskDesc: taskDesc,
        taskCat: taskCat,
        completed: false));
    notifyListeners();
  }

  void toggleTask(TaskModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    final taskIndex = _tasks.indexOf(task);
    if (taskIndex != -1) {
      _tasks[taskIndex] = task;
      notifyListeners();
    }
  }
}
