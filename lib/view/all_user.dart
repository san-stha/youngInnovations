import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:get/get.dart";
import 'package:young_innovation/components/bottom_nav_bar.dart';
import 'package:young_innovation/components/custom_text.dart';
import 'package:young_innovation/controller/album_controller.dart';
import 'package:young_innovation/controller/all_user_controller.dart';
import 'package:young_innovation/controller/post_controller.dart';
import 'package:young_innovation/controller/to_do_controller.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/utils/string.dart';

class AllUser extends StatelessWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allUser = Get.find<AllUserController>();
    var album = Get.find<AlbumController>();
    var post = Get.find<PostController>();
    var toDo = Get.find<ToDoController>();

    return SafeArea(child: Scaffold(body: Obx(() {
      return allUser.processing.value
          ? const Center(
              child: CupertinoActivityIndicator(
                color: ThemeColor.primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Users",
                        style: TextStyle(
                            fontSize: ThemeString.f18,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.primaryTextColor),
                      ),
                    ),
                    StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: allUser.allUser.length,
                        itemBuilder: (BuildContext context, int index) {
                          var mydata = allUser.allUser[index];
                          return Card(
                            color: ThemeColor.secondaryColor,
                            elevation: .5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    child: Icon(Icons.person),
                                  ),
                                  Text(
                                    mydata.name!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(mydata.email!),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: ThemeColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          // width: MediaQuery.of(context).size.width,
                                          child: IconButton(
                                            onPressed: () {
                                              Get.bottomSheet(Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .25,
                                                color: ThemeColor.primaryColor,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const CustomText(
                                                              text: "Street : ",
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                          CustomText(
                                                            text: mydata
                                                                .address!.street
                                                                .toString(),
                                                            fontSize:
                                                                ThemeString.f16,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const CustomText(
                                                            text: "Suite : ",
                                                            fontSize:
                                                                ThemeString.f16,
                                                            color: Colors.white,
                                                          ),
                                                          CustomText(
                                                              text: mydata
                                                                  .address!
                                                                  .suite
                                                                  .toString(),
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const CustomText(
                                                            text: "City : ",
                                                            fontSize:
                                                                ThemeString.f16,
                                                            color: Colors.white,
                                                          ),
                                                          CustomText(
                                                            text: mydata
                                                                .address!.city
                                                                .toString(),
                                                            fontSize:
                                                                ThemeString.f16,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                              text:
                                                                  "Zip Code : ",
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                          CustomText(
                                                              text: mydata
                                                                  .address!
                                                                  .zipcode
                                                                  .toString(),
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                              text:
                                                                  "Latitude : ",
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                          CustomText(
                                                              text: mydata
                                                                  .address!
                                                                  .geo!
                                                                  .lat
                                                                  .toString(),
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                              text:
                                                                  "Longitude : ",
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                          CustomText(
                                                              text: mydata
                                                                  .address!
                                                                  .geo!
                                                                  .lng
                                                                  .toString(),
                                                              fontSize:
                                                                  ThemeString
                                                                      .f16,
                                                              color:
                                                                  Colors.white),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                            },
                                            icon: const Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                            // label: const Text("Address",
                                            //     style: TextStyle(
                                            //         color: Colors.white))
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: ThemeColor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: IconButton(
                                            onPressed: () {
                                              album.getAlbum(mydata.id!);
                                              post.getPost(mydata.id!);
                                              toDo.getToDO(mydata.id!);
                                              Get.to(
                                                  () => const BottomNavBar());
                                            },
                                            icon: const Icon(
                                              Icons.info_outline,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
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
