import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:young_innovation/controller/all_post_controller.dart';
import 'package:young_innovation/controller/all_user_controller.dart';
import 'package:young_innovation/controller/comment_controller.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/string.dart';
import 'package:young_innovation/view/all_user.dart';
import 'package:young_innovation/widget.dart/posts_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allPost = Get.find<AllPostController>();
    var comment = Get.find<CommentController>();
    var allUser = Get.find<AllUserController>();

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeColor.backgroundColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1)),
                    child: IconButton(
                        onPressed: () {
                          allUser.getAllUser();
                          Get.to(() => const AllUser());
                        },
                        icon: const Icon(
                          Icons.person,
                          color: ThemeColor.primaryColor,
                        )),
                  ),
                )
              ],
            ),
            body: Obx(() {
              return allPost.processing.value
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: ThemeColor.primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Text(
                              "All Posts",
                              style: TextStyle(
                                  fontSize: ThemeString.f18,
                                  color: ThemeColor.primaryTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allPost.allPost.length,
                              itemBuilder: (BuildContext context, int index) {
                                var mydata = allPost.allPost[index];
                                return PostsWidget(
                                    comment: comment, mydata: mydata);
                              })
                        ],
                      ),
                    );
            })));
  }
}
