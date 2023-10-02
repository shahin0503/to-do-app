class TaskModel {
  int id;
  String taskName;
  String taskDesc;
  String taskCat;
  bool completed;
  TaskModel(
      
    {
      required this.id,
      required this.taskName,
      required this.taskDesc,
      required this.taskCat,
      this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModel &&
          runtimeType == other.runtimeType &&
          taskName == other.taskName &&
          taskDesc == other.taskDesc &&
          taskCat == other.taskCat &&
          completed == other.completed;

  @override
  int get hashCode =>
      taskName.hashCode ^
      taskDesc.hashCode ^
      taskCat.hashCode ^
      completed.hashCode;
}
