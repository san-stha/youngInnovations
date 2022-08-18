import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:young_innovation/controller/photo_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../utils/color.dart';

class Photo extends StatelessWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var photo = Get.find<PhotoController>();
    return SafeArea(child: Scaffold(body: Obx(() {
      return photo.processing.value
          ? const Center(
              child: CupertinoActivityIndicator(
                color: ThemeColor.primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: photo.photo.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mydata = photo.photo[index];
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(mydata.url!.toString()),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          // CachedNetworkImage(
                          //   imageUrl: mydata.url!.toString(),
                          //   progressIndicatorBuilder:
                          //       (context, url, downloadProgress) =>
                          //           CircularProgressIndicator(
                          //               value: downloadProgress.progress),
                          //   errorWidget: (context, url, error) => Icon(Icons.error),
                          // ),

                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  mydata.title!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    );
                  }),
            );
    })));
  }
}
