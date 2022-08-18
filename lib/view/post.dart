import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:young_innovation/controller/post_controller.dart';
import 'package:young_innovation/controller/comment_controller.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/string.dart';
import 'package:young_innovation/widget.dart/user_post.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = Get.find<PostController>();
    var comment = Get.find<CommentController>();

    return SafeArea(child: Scaffold(
      body: Obx(() {
        return post.processing.value
          ? const Center(
              child: CupertinoActivityIndicator(
                color: ThemeColor.primaryColor,
              ),
            )
          : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Posts",
                    style: TextStyle(
                        fontSize: ThemeString.f18,
                        color: ThemeColor.primaryTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: post.post.length,
                    itemBuilder: (BuildContext context, int index) {
                      var mydata = post.post[index];
                     return UserPostWidget(comment: comment, post: post, mydata: mydata);
                    })
              ],
            ),
          ),
        );
      }),
    ));
  }
}
