import 'package:flutter_test/flutter_test.dart';
import 'package:notjusttodoapp/models/task_model.dart';

void main() {
  group('TaskModel', () {
    test('TaskModel toggleCompleted() should toggle completed status', () {
      TaskModel task = TaskModel(
          id: 1,
          taskName: 'Task 1',
          taskDesc: 'Description',
          taskCat: 'Work',
          completed: false);

      task.toggleCompleted();

      expect(task.completed, true);
    });

    test('TaskModel equality should work correctly', () {
      TaskModel task1 = TaskModel(
          id: 1,
          taskName: 'Task 1',
          taskDesc: 'Description',
          taskCat: 'Work',
          completed: false);
      TaskModel task2 = TaskModel(
          id: 1,
          taskName: 'Task 1',
          taskDesc: 'Description',
          taskCat: 'Work',
          completed: false);

      expect(task1, task2);
    });
  });
}
