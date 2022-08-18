import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:young_innovation/components/error_snackbar.dart';
import 'package:young_innovation/controller/to_do_controller.dart';
import 'package:young_innovation/service/remote_service.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/text_controllers.dart';

class AddToDoWidget extends StatelessWidget {
  const AddToDoWidget({
    Key? key,
    required this.toDo,
  }) : super(key: key);

  final ToDoController toDo;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Get.bottomSheet(
          Container(
          height: MediaQuery.of(context).size.height * .20,
          color: ThemeColor.primaryColor,
          child: TextFormField(
            controller: toDoTitle,
            decoration: InputDecoration(
                labelText: "add todo title . . . .",
                labelStyle: const TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                    onPressed: () async {
                      Map data = {
                        "title": toDoTitle.text,
                        "completed": false
                      };
                      if (toDoTitle.text.isEmpty) {
                        errorSnackbar("Please enter title text!");
                        return;
                      }
                      await RemoteService.postData(
                          "users/${toDo.toDO[0].id}/todos", data);
                      toDoTitle.clear();
                    },
                    icon: const Icon(Icons.send)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(width: 2, color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 3, color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 3))),
            validator: (value) => value!.isEmpty ? 'required' : null,
            keyboardType: TextInputType.text,
          ),
        ));
      },
      backgroundColor: ThemeColor.secondaryColor,
      child: const Icon(Icons.add),
    );
  }
}
