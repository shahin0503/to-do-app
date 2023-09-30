import 'package:flutter/material.dart';
import 'package:notjusttodoapp/provider/task_provider.dart';
import 'package:notjusttodoapp/utilities/update_task_dialog.dart';
import 'package:provider/provider.dart';

class AllTasksView extends StatefulWidget {
  const AllTasksView({super.key});

  @override
  State<AllTasksView> createState() => _AllTasksViewState();
}

class _AllTasksViewState extends State<AllTasksView> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context);

    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => ListTile(
            leading: Checkbox(
              value: task.allTasks[index].completed,
              onChanged: ((_) => task.toggleTask(task.allTasks[index])),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(task.allTasks[index].taskName),
                Text('Category: ${task.allTasks[index].taskCat}')
              ],
            ),
            subtitle: Text(task.allTasks[index].taskDesc),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    final selectedTask = task.allTasks[index];
                    String taskName = selectedTask.taskName;
                    String taskDesc = selectedTask.taskDesc;
                    String taskCat = selectedTask.taskCat;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return UpdateTaskAlertDialog(
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
                      task.deleteTask(task.allTasks[index]);
                    },
                    icon: const Icon(Icons.delete)),
              ],
            ),
          )),
    );
  }
}
