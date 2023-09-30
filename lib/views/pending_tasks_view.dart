import 'package:flutter/material.dart';
import 'package:notjusttodoapp/provider/task_provider.dart';
import 'package:provider/provider.dart';

class PendingTasksView extends StatefulWidget {
  const PendingTasksView({super.key});

  @override
  State<PendingTasksView> createState() => _PendingTasksViewState();
}

class _PendingTasksViewState extends State<PendingTasksView> {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context);
    if (task.pendingTasks.isEmpty) {
      return const Center(child: Text('No pending tasks..'));
    } else {
      return ListView.builder(
        itemCount: task.pendingTasks.length,
        itemBuilder: ((context, index) => ListTile(
              leading: Checkbox(
                value: task.pendingTasks[index].completed,
                onChanged: ((_) => task.toggleTask(task.pendingTasks[index])),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(task.pendingTasks[index].taskName),
                  Text('Category: ${task.pendingTasks[index].taskCat}')
                ],
              ),
              subtitle: Text(task.pendingTasks[index].taskDesc),
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
