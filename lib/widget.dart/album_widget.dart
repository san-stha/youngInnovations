import 'package:flutter/material.dart';
import 'package:young_innovation/controller/photo_controller.dart';
import 'package:young_innovation/model/album_model.dart';
import 'package:get/get.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/view/photo.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({
    Key? key,
    required this.photo,
    required this.mydata,
  }) : super(key: key);

  final PhotoController photo;
  final AlbumModel mydata;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        photo.getPhoto(mydata.id!);
        Get.to(() => const Photo());
      },
      child: Stack(
        children: [
          Card(
            child: Column(
              children: [
                const Icon(
                  Icons.photo_album,
                  color: ThemeColor.secondaryColor,
                  size: 160,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(mydata.title!),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
