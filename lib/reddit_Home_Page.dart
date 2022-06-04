import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit/pages/communities_page.dart';
import 'package:reddit/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:reddit/pages/message_page.dart';
import 'package:reddit/pages/notifications_page.dart';
import 'package:reddit/pages/post_page.dart';

class MyMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyMainPageState();

}

class MyMainPageState extends State<MyMainPage> {
  int currentPageIndex = 0;
  final List pages = [RedditHomePage(), RedditCommunitiesPage(), RedditPostPage(), RedditMessagePage(), RedditNotificationsPage()];

  changePage(int pageIndex) {
    setState(() {
      currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(40.0), // here the desired height
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 18, 18, 18),
          leading: Image.asset("assets/images/3.png", height: 35.0,),
          title: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(32, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(3))
            ),
            width: screenSize.width * 0.93,
            height: 32.0,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextField(
              style: const TextStyle(
                height: 2.3,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                prefixIcon: const Icon(Icons.search, color: Colors.white54, size: 20,),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide(width: 0.07, color: Colors.white),)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color.fromARGB(255, 18, 18, 18),
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: const IconThemeData(color: Colors.white,),
          unselectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(color: Colors.white,),
          selectedItemColor: Colors.white,
          onTap: changePage,
          currentIndex: currentPageIndex,
          items: [
            BottomNavigationBarItem(icon: currentPageIndex == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined, color: Colors.white60,), label: 'Home'),
            BottomNavigationBarItem(icon: currentPageIndex == 1 ? Image.asset("assets/images/6.png", height: 22.0, color: Colors.white,) : Image.asset("assets/images/5.png", height: 22.0, color: Colors.white60,), label: 'Communities'),
            BottomNavigationBarItem(icon: currentPageIndex == 2 ? const Icon(Icons.add, color: Colors.white,) : const Icon(Icons.add, color: Colors.white60,), label: 'Post'),
            BottomNavigationBarItem(icon: currentPageIndex == 3 ? Image.asset("assets/images/2.png", height: 25.0,) : Image.asset("assets/images/1.png", height: 25.0, color: Colors.white60,), label: 'Message'),
            BottomNavigationBarItem(icon: currentPageIndex == 4 ? const Icon(Icons.notifications, color: Colors.white,) : const Icon(Icons.notifications_none_outlined, color: Colors.white60,), label: 'Notifications'),
          ],
        ),
      ),
    );
  }
}