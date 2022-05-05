import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:project2/sources.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (t){setState(() {});});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App"
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: todoList.map((e) => InkWell(
          onTap: (){
            e.isOpen = !e.isOpen;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              child: AnimatedContainer(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                duration: const Duration(seconds: 1),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.time),
                    const SizedBox(height: 5,),
                    Text(e.title),
                    const SizedBox(height: 5,),
                    (e.isOpen)?Text(e.todo):Container(),
                  ],
                ),
              )
            ),
          ),
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.pushNamed(context, "addToDo");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
