import 'package:flutter/material.dart';
import 'package:young_innovation/components/error_snackbar.dart';
import 'package:young_innovation/controller/comment_controller.dart';
import 'package:young_innovation/service/remote_service.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/text_controllers.dart';

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final CommentController comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: ThemeColor.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          controller: commentBody,
          decoration: InputDecoration(
              labelText: "write a comment . . . . ",
              labelStyle: const TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                  onPressed: () async {
                    Map data = {
                      "postId": comment.comment[0].postId,
                      "name": "Leanne Graham",
                      "email": "Sincere@april.biz",
                      "body": commentBody.text,
                    };
                    if (commentBody.text.isEmpty) {
                      errorSnackbar("Please enter some text!");
                      return;
                    }
                    await RemoteService.postData(
                        "posts/${comment.comment[0].postId}/comments", data);
                    commentBody.clear();
                  },
                  icon: const Icon(Icons.send)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 2, color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(width: 3, color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red, width: 3))),
          validator: (value) => value!.isEmpty ? 'required' : null,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
