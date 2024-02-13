import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'go Shoping', isDone: false),
    Task(name: 'go to Home', isDone: false),
    Task(name: 'Task3', isDone: false)
  ];

  bool swichState = false;
  String switchText = 'task Status';
  late String newTaskTitle;

  void addTask(String tasktitle, bool isDone) {
    newTaskTitle = tasktitle;
    tasks.add(Task(name: newTaskTitle, isDone: isDone));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  bool changeSwichState(bool newvalue) {
    swichState = newvalue;
    if (swichState) {
      switchText = 'is Done';
    } else {
      switchText = 'is not Done';
    }
    notifyListeners();
    return swichState;
  }
}
