import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:young_innovation/controller/comment_controller.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/string.dart';
import 'package:young_innovation/widget.dart/add_comment_widget.dart';
import 'package:young_innovation/widget.dart/comment_widget.dart';

class Comment extends StatelessWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comment = Get.find<CommentController>();
    return Scaffold(
      body: Obx(() {
        return comment.processing.value
          ? const Center(
              child: CupertinoActivityIndicator(
                color: ThemeColor.primaryColor,
              ),
            )
          : SingleChildScrollView(
          child: Column(
            children: [
              StickyHeader(
                  header: AddCommentWidget(comment: comment),
                  content: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Comments",
                            style: TextStyle(
                                fontSize: ThemeString.f18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: comment.comment.length,
                            itemBuilder: (BuildContext context, int index) {
                              var mydata = comment.comment[index];
                              return CommentWidget(mydata: mydata);
                            }),
                      ],
                    ),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
