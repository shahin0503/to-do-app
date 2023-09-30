import 'package:flutter/material.dart';
import 'package:notjusttodoapp/models/task_model.dart';
import 'package:notjusttodoapp/provider/task_provider.dart';
import 'package:provider/provider.dart';

class UpdateTaskAlertDialog extends StatefulWidget {
  final String taskName, taskDesc, taskCat;
  const UpdateTaskAlertDialog(
      {super.key,
      required this.taskName,
      required this.taskDesc,
      required this.taskCat});

  @override
  State<UpdateTaskAlertDialog> createState() => _UpdateTaskAlertDialogState();
}

class _UpdateTaskAlertDialogState extends State<UpdateTaskAlertDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final List<String> taskCat = ['Work', 'Shopping', 'Other'];
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    taskNameController.text = widget.taskName;
    taskDescController.text = widget.taskDesc;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: const Text('Edit Task'),
      scrollable: true,
      content: SizedBox(
        height: height * 0.55,
        width: width,
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: taskNameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Task',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(
                    Icons.list_sharp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Task Description',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(
                    Icons.messenger_outline_sharp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.label_important_outline_rounded),
                  const SizedBox(width: 15.0),
                  Expanded(
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          isExpanded: true,
                          value: widget.taskCat,
                          items: taskCat
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) => setState(() {
                                selectedValue = value!;
                              })))
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;
            final taskCat = selectedValue;

            if ((taskName.isNotEmpty && taskDesc.isNotEmpty)) {
              await updateTask(taskName, taskDesc, taskCat);

              Navigator.of(context, rootNavigator: true).pop();

              _clearAll();
            } else {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title: const Text('Error!!!'),
                      content: const Text(
                          'Task Name and Task Description are required fields'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  }));
            }
          },
          child: const Text('Edit'),
        ),
      ],
    );
  }

  updateTask(String taskName, String taskDesc, String taskCat) {
    TaskModel updatedTask = TaskModel(
      taskName: taskName,
      taskDesc: taskDesc,
      taskCat: taskCat,
    );
    Provider.of<TaskProvider>(context, listen: false).updateTask(updatedTask);
  }

  void _clearAll() {
    taskNameController.text = '';
    taskDescController.text = '';
  }
}
