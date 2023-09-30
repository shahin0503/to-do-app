import 'package:flutter/material.dart';
import 'package:notjusttodoapp/provider/task_provider.dart';
import 'package:provider/provider.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({super.key});

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context);

    if (task.completedTasks.isEmpty) {
      return const Center(child: Text('No completed tasks...'));
    } else {
      return ListView.builder(
        itemCount: task.completedTasks.length,
        itemBuilder: ((context, index) => ListTile(
              leading: Checkbox(
                value: task.completedTasks[index].completed,
                onChanged: ((_) => task.toggleTask(task.completedTasks[index])),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(task.completedTasks[index].taskName),
                  Text('Category: ${task.completedTasks[index].taskCat}')
                ],
              ),
              subtitle: Text(task.completedTasks[index].taskDesc),
              trailing: IconButton(
                  onPressed: () {
                    task.deleteTask(task.allTasks[index]);
                  },
                  icon: const Icon(Icons.delete)),
            )),
      );
    }
  }
}
