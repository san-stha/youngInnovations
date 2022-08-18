import 'package:flutter/material.dart';
import 'package:young_innovation/controller/comment_controller.dart';
import 'package:young_innovation/controller/post_controller.dart';
import 'package:get/get.dart';
import 'package:young_innovation/model/post_model.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/view/comment.dart';

class UserPostWidget extends StatelessWidget {
  const UserPostWidget({
    Key? key,
    required this.comment,
    required this.post,
    required this.mydata,
  }) : super(key: key);

  final CommentController comment;
  final PostController post;
  final PostModel mydata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: ThemeColor.secondaryColor),
          color: ThemeColor.backgroundColor,
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(mydata.userId.toString()),
              ),
              subtitle: RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Text(mydata.title.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))),
                const WidgetSpan(
                    child: Divider(
                  color: Color.fromRGBO(0, 0, 0, .1),
                )),
                WidgetSpan(
                    child: Text(
                  mydata.body.toString(),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                )),
              ])),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {
                    comment.getComment(mydata.id!);
                    Get.to(() => const Comment());
                  },
                  icon: const Icon(
                    Icons.comment_outlined,
                    color: ThemeColor.primaryColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
