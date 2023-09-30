class TaskModel {
  String taskName;
  String taskDesc;
  String taskCat;
  bool completed;
  TaskModel(
      {required this.taskName,
      required this.taskDesc,
      required this.taskCat,
      this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
