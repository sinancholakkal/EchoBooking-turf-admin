import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SideMenuSection extends StatelessWidget {
  const SideMenuSection({
    super.key,
    required this.items,
    required this.sideMenu,
  });

  final List<SideMenuItem> items;
  final SideMenuController sideMenu;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      style: SideMenuStyle(
          selectedColor: Colors.blue,
          selectedTitleTextStyle: TextStyle(color: kwhite),
          selectedIconColor: kwhite,
          unselectedTitleTextStyle: TextStyle(color: Colors.white60),
          unselectedIconColor: Colors.white60,
          backgroundColor: const Color.fromARGB(255, 23, 24, 51)),
      items: items,
      controller: sideMenu,
      title: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            "asset/beckham-david-male-males-wallpaper-preview-removebg-preview.png",
          ),
        ),
      ),
      onDisplayModeChanged: (mode) {
        print(mode);
      },
    );
  }
}