import 'package:flutter/material.dart';
import 'package:young_innovation/model/comment_model.dart';
import 'package:young_innovation/utils/color.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.mydata,
  }) : super(key: key);

  final CommentModel mydata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ThemeColor.secondaryColor,
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: Text(mydata.email.toString()),
              subtitle: RichText(
                  text: TextSpan(children: [
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
            )
          ],
        ),
      ),
    );
  }
}
