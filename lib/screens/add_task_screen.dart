import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCollback;

  AddTaskScreen(this.addTaskCollback);

  @override
  Widget build(BuildContext context) {
    bool switchState = false;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTitle) {
                Provider.of<TaskData>(context, listen: false).newTaskTitle =
                    newTitle;
              },
              decoration: InputDecoration(
                hintText: 'Task Tit',
                label: Text(
                  'Lable',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: Provider.of<TaskData>(context).swichState,
                  onChanged: (newValue) {
                    Provider.of<TaskData>(context, listen: false)
                        .changeSwichState(newValue);
                  },
                ),
                Text(
                  Provider.of<TaskData>(context).switchText,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                switchState =
                    Provider.of<TaskData>(context, listen: false).swichState;
                Provider.of<TaskData>(context, listen: false).addTask(
                    Provider.of<TaskData>(context, listen: false).newTaskTitle,
                    switchState);
                print(switchState.toString());
                Navigator.of(context).pop();
              },
              child: Text('Add'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal[400],
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
