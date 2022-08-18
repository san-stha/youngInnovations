import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:young_innovation/controller/album_controller.dart';
import 'package:get/get.dart';
import 'package:young_innovation/controller/photo_controller.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/string.dart';
import 'package:young_innovation/widget.dart/album_widget.dart';

class Album extends StatelessWidget {
  const Album({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var album = Get.find<AlbumController>();
    var photo = Get.find<PhotoController>();

    return SafeArea(child: Scaffold(body: Obx(() {
      return album.processing.value
          ? const Center(
              child: CupertinoActivityIndicator(
                color: ThemeColor.primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Albums",
                        style: TextStyle(
                            fontSize: ThemeString.f18,
                            color: ThemeColor.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: album.album.length,
                        itemBuilder: (BuildContext context, int index) {
                          var mydata = album.album[index];

                          return AlbumWidget(photo: photo, mydata: mydata);
                        },
                        staggeredTileBuilder: (index) {
                          return const StaggeredTile.fit(1);
                        })
                  ],
                ),
              ),
            );
    })));
  }
}
