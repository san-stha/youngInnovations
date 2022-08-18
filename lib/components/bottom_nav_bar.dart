import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:young_innovation/utils/color.dart';
import 'package:young_innovation/view/album.dart';
import 'package:young_innovation/view/home.dart';
import 'package:young_innovation/view/post.dart';
import 'package:young_innovation/view/to_do.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int barIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.floating,
        snakeViewColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        backgroundColor: ThemeColor.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (int value) {
          setState(() {
            barIndex = value;
          });
        },
        currentIndex: barIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note_outlined),
            label: "Photos",
            activeIcon: Icon(
              Icons.note,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.list_alt_outlined,
              color: Colors.black,
            ),
            icon: Icon(Icons.list_alt),
            label: "To-Dos",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album_outlined,
            ),
            label: "Albums",
            activeIcon: Icon(
              Icons.photo_album,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: barIndex == 0
          ? const Post()
          : barIndex == 1
              ? const ToDo()
              : const Album(),
    );
  }
}
