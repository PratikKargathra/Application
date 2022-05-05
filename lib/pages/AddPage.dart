import 'package:flutter/material.dart';
import 'package:project2/sources.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  TimeOfDay timeDay = TimeOfDay.now();

  TextEditingController todo = TextEditingController();
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        timeDay = await showTimePicker(
                          initialTime: timeDay,
                          initialEntryMode: TimePickerEntryMode.dial,
                          context: context,
                        ) ?? timeDay;
                        setState(() {});
                      },
                      child: const Text("Change Date"),
                    ),
                    Text("${timeDay.hour} ${timeDay.minute} ${(timeDay.periodOffset==1)?"PM":"AM"}", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w600),),
                  ],
                ),
                const SizedBox(height: 20,),
                 TextField(
                   controller: title,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Title",
                    label: Text("Title"),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: todo,
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter ToDo",
                    label: Text("Todo"),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        todoList.add(
                            TodoApp(todo: todo.text, time: "${timeDay.hour} ${timeDay.minute} ${(timeDay.periodOffset==1)?"PM":"AM"}", title: title.text, isOpen: false),
                        );
                        Navigator.pushNamed(context, "/");
                      });
                    },
                    child: const Text("ADD TODO"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

