import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:echo_booking_admin/core/constent/text.dart';
import 'package:echo_booking_admin/core/theme/colors.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_owner/owner.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/tab_review/reviews.dart';
import 'package:echo_booking_admin/feature/presentation/pages/tabs/user.dart';
import 'package:echo_booking_admin/feature/presentation/widgets/heading_text.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  int initialTab;
   ScreenHome({super.key,required this.initialTab});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late PageController pageController;
  late SideMenuController sideMenu;

  late List<SideMenuItem> items;
  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialTab);
    sideMenu = SideMenuController(initialPage: widget.initialTab);
    items = [
      sideMenuItem(title: "Owners", icon: Icons.person),
      sideMenuItem(title: "Users", icon: Icons.supervised_user_circle_sharp),
      sideMenuItem(title: "Review", icon: Icons.pending_actions),
    ];
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();

  }
  

  SideMenuItem sideMenuItem({required String title, required IconData icon}) {
    return SideMenuItem(
        title: title,
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: Icon(icon));
  }
@override
  void dispose() {
    pageController.dispose();
    sideMenu.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
    
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 23, 24, 51),
        title: HeadingText(text: appTitle),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
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
          ),
          Expanded(
              child: PageView(
            controller: pageController,
            children: [
              TabOwners(),
              TabUsers(),
              TabReviews()
            ],
          ))
        ],
      ),
    );
  }
}