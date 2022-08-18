import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:young_innovation/controller/to_do_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:young_innovation/service/remote_service.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/string.dart';
import 'package:young_innovation/widget.dart/add_to_do_widget.dart';
import 'package:young_innovation/widget.dart/to_do_widget.dart';

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var toDo = Get.find<ToDoController>();
    return SafeArea(
        child: Scaffold(
            floatingActionButton: AddToDoWidget(toDo: toDo),
            body: Obx(() {
              return toDo.processing.value
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: ThemeColor.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "To Dos",
                                style: TextStyle(
                                    fontSize: ThemeString.f18,
                                    color: ThemeColor.primaryTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: toDo.toDO.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var mydata = toDo.toDO[index];
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: ((context) async {
                                                await RemoteService.deleteData(
                                                    'todos/${mydata.id}');
                                                toDo.getToDO(mydata.userId!);
                                              }),
                                              foregroundColor: Colors.red,
                                              icon: Icons.delete,
                                            ),
                                            SlidableAction(
                                              onPressed: (context) {},
                                              icon: Icons.edit,
                                              foregroundColor: Colors.blue,
                                            ),
                                          ],
                                        ),
                                        child: ToDoWidget(
                                            toDo: toDo, mydata: mydata)),
                                  );
                                }),
                            const SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    );
            })));
  }
}
