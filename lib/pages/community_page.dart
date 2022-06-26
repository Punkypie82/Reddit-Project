import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reddit/pages/community_page_description.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Community.dart';
import 'comments_page.dart';
import 'package:reddit/Post.dart';
import 'package:reddit/comment.dart';

class CommunityPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CommunityPageState();
}

class CommunityPageState extends State with TickerProviderStateMixin {

  Community community = Community('nasa', 'https://i.postimg.cc/XJ21qVkb/unnamed.jpg', 'r/NASA is for anything related to the National Aeronautics and Space Administration; the latest news, events, current and future missions, and more.', 'https://i.postimg.cc/T3S4fHw7/spacee-1920x1200.jpg', 1970693, 143);
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(337),
        child: Container(
          color: const Color.fromARGB(255, 18, 18, 18),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(community.backgroundImage,
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PreferredSize(
                        preferredSize: const Size.fromHeight(40.0), // here the desired height
                        child:AppBar(
                          title: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(171, 0, 0, 0),
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
                          actions: const <Widget>[
                            IconButton(icon: Icon(FontAwesomeIcons.arrowUpFromBracket, color: Colors.white60,), onPressed: null),
                            IconButton(icon: Icon(Icons.more_horiz, color: Colors.white60,), onPressed: null),
                          ],
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 90.0, 0.0, 0.0),
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      margin: const EdgeInsets.only(right: 7.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 18, 18, 18), width: 4.0),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(community.profileImage)
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(23.0, 0.0, 0.0, 0.0),
                    child: Text('r/' + community.name,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 215, 218, 220),
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            Container(
                              height: 30.0,
                              width: 30.0,
                              margin: const EdgeInsets.only(left: 8.5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromARGB(255, 43, 98, 180), width: 2.0),
                                shape: BoxShape.circle,
                              ),
                            ),
                            IconButton(icon: const Icon(Icons.notifications, color: Color.fromARGB(255, 43, 98, 180), size: 23.0,), onPressed: null,),
                          ],
                        ),
                        InkWell(
                          child: Container(
                            height: 30.0,
                            width: 100.0,
                            padding: EdgeInsets.only(left: 20.0, top: 2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(color: Color.fromARGB(255, 43, 98, 180), width: 2.0),
                            ),
                            child: Text('Joined', style: TextStyle(color: Color.fromARGB(255, 43, 98, 180), fontSize: 17),),
                          ),
                          onTap: null,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.0, top: 3.0),
                child: Row(
                  children: [
                    Text(myFormat.format(community.memberCount) + ' members • ', style: TextStyle(color: Color.fromARGB(255,103,103,103), fontSize: 15),),
                    Text(myFormat.format(community.onlineCount) + ' online', style: TextStyle(color: Color.fromARGB(255,103,103,103), fontSize: 15),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 23.0, top: 5.0, right: 23.0, bottom: 15.0),
                child: Text(community.description, style: TextStyle(color: Color.fromARGB(200,206,206,206), fontSize: 15),),
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Posts',),
                  Tab(text: 'About',),
                ],
              )
            ],
          ),
        ),
      ),














      body:
      // Container(),
      TabBarView(
        controller: _tabController,
        children: [
          CommunityPageDes(),
          Container(),
        ],
      ),
    );
  }
}