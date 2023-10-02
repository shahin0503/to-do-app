import 'package:flutter/material.dart';
import 'package:notjusttodoapp/provider/filter_provider.dart';
import 'package:notjusttodoapp/provider/task_provider.dart';
import 'package:notjusttodoapp/utilities/update_task_dialog.dart';
import 'package:provider/provider.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({super.key});

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final filterProvider = Provider.of<FilterProvider>(context);

    final selectedCategories = filterProvider.filter.selectedCategories;

    final filteredTasks = taskProvider.completedTasks
        .where((task) =>
            selectedCategories.isEmpty ||
            selectedCategories.contains(task.taskCat))
        .toList();

    if (filteredTasks.isEmpty) {
      return const Center(child: Text('No completed tasks...'));
    } else {
      return ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: ((context, index) => ListTile(
              leading: Checkbox(
                value: filteredTasks[index].completed,
                onChanged: ((_) => taskProvider.toggleTask(filteredTasks[index])),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(filteredTasks[index].taskName),
                  Text(filteredTasks[index].taskCat)
                ],
              ),
              subtitle: Text(filteredTasks[index].taskDesc),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      final selectedTask = taskProvider.allTasks[index];
                      final id = taskProvider.allTasks[index].id;
                      String taskName = selectedTask.taskName;
                      String taskDesc = selectedTask.taskDesc;
                      String taskCat = selectedTask.taskCat;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return UpdateTaskAlertDialog(
                              id: id,
                              taskName: taskName,
                              taskDesc: taskDesc,
                              taskCat: taskCat,
                            );
                          });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                      onPressed: () {
                        taskProvider.deleteTask(taskProvider.allTasks[index]);
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            )),
      );
    }
  }
}
