import 'package:flutter/material.dart';
import 'package:young_innovation/controller/to_do_controller.dart';
import 'package:young_innovation/model/to_do_model.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({
    Key? key,
    required this.toDo,
    required this.mydata,
  }) : super(key: key);

  final ToDoController toDo;
  final ToDoModel mydata;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 1,
            color: mydata.completed.toString() == "true"
                ? Colors.green
                : Colors.red),
      ),
      child: ListTile(
          title: Text(
            mydata.title!,
          ),
          trailing: mydata.completed.toString() == "true"
              ? const Icon(
                  Icons.done_outline,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.pending_actions_rounded,
                  color: Colors.red,
                )),
    );
  }
}
