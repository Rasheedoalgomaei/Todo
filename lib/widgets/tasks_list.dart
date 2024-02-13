import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import '../models/task.dart';
import 'task_tils.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: Provider.of<TaskData>(context).tasks.length,
          itemBuilder: (context, item) {
            return TaskTils(
              isChecked: taskData.tasks[item].isDone!,
              taskTitle: taskData.tasks[item].name,
              checkboxChange: (newValue) {
                taskData.updateTask(taskData.tasks[item]);
              },
              listTileDelete: () {
                taskData.removeTask(taskData.tasks[item]);
              },
            );
          },
        );
      },
    );
  }
}
