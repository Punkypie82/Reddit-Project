import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Community.dart';
import 'comments_page.dart';
import 'package:reddit/Post.dart';
import 'package:reddit/comment.dart';

class CommunityPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CommunityPageState();
}

class CommunityPageState extends State {

  Community community = Community('nasa', 'https://i.postimg.cc/XJ21qVkb/unnamed.jpg', 'r/NASA is for anything related to the National Aeronautics and Space Administration; the latest news, events, current and future missions, and more.', 'https://i.postimg.cc/T3S4fHw7/spacee-1920x1200.jpg', 1970693, 143);
  Comment comment = Comment('https://external-preview.redd.it/1mF2BkbuRUyI5Od8V7aTZDVS_Y8-GMWeT4zvv7e_IrI.jpg?auto=webp&s=6dd561c5c1c1d69de69a56c8afaf4d5e3269d537', "Rashin Rahnamun", '34m', 'wow this is awsome!!');
  late Post post = Post('https://external-preview.redd.it/1mF2BkbuRUyI5Od8V7aTZDVS_Y8-GMWeT4zvv7e_IrI.jpg?auto=webp&s=6dd561c5c1c1d69de69a56c8afaf4d5e3269d537', "https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?k=20&m=1093110112&s=612x612&w=0&h=3OhKOpvzOSJgwThQmGhshfOnZTvMExZX2R91jNNStBY=", 'r/gifs', 'u/Amirhossein', '19h', 'Beautiful green walkway.', 'Nice beautiful day in nature.', comment);


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
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
      body: Container(
        color: const Color.fromARGB(255, 18, 18, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Image.network(community.backgroundImage,
                  height: 160.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 100.0, 0.0, 0.0),
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
                  padding: EdgeInsets.fromLTRB(23.0, 5.0, 0.0, 0.0),
                  child: Text('r/' + community.name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 215, 218, 220),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 30.0,
                  margin: const EdgeInsets.only(right: 7.0),
                  padding: const EdgeInsets.only(right: 17.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 43, 98, 180), width: 2.0),
                      shape: BoxShape.circle,
                  ),
                  child: IconButton(icon: const Icon(Icons.notifications, color: Color.fromARGB(255, 43, 98, 180), size: 15.0,), onPressed: null,),
                ),
              ],
            ),
            Container(
              height: 800.0,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  upVote() {
                    setState(() {
                      post.upVoteEnabled ? post.upVoteEnabled = false : post.upVoteEnabled = true;
                      if (post.downVoteEnabled && post.upVoteEnabled) {post.downVoteEnabled = false; post.upvotes++;}
                      if (post.upVoteEnabled) post.upvotes++;
                      else post.upvotes--;
                    });
                  }
                  downVote() {
                    setState(() {
                      post.downVoteEnabled ? post.downVoteEnabled = false : post.downVoteEnabled = true;
                      if (post.upVoteEnabled && post.downVoteEnabled) {post.upVoteEnabled = false; post.upvotes--;}
                      if (post.downVoteEnabled) post.upvotes--;
                      else post.upvotes++;
                    });
                  }
                  return Container(
                      color: const Color.fromARGB(255, 18, 18, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: 10.0,
                            color: Color.fromARGB(255, 9, 9, 9),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 11.0, 10.0, 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 40.0,
                                      width: 40.0,
                                      margin: const EdgeInsets.only(right: 7.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(post.profilePictureUrl)
                                          )
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(post.subReddit, style: const TextStyle(color: Color.fromARGB(255, 215, 218, 220), fontWeight: FontWeight.w400)),

                                        Text(post.username + " • " + post.date, style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.w300))
                                      ],
                                    )
                                  ],
                                ),
                                const Icon(Icons.more_horiz, color: Colors.white60,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
                            child: Text(post.title, style: const TextStyle(fontWeight: FontWeight.w500, color: Color.fromARGB(255, 215,218,220), fontSize: 20.0),),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Image.network(
                                    post.postUrl,
                                    fit: BoxFit.cover,
                                  )
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
                            child: Linkify(
                              onOpen: (link) async {
                                if (await canLaunch(link.url)) {
                                  await launch(link.url);
                                } else {
                                  throw 'Could not launch $link';
                                }
                              },
                              text: post.description,
                              style: const TextStyle(color: Color.fromARGB(255, 215, 218, 220), fontWeight: FontWeight.w300, fontSize: 13.0),
                              linkStyle: const TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(onPressed: upVote, icon: post.upVoteEnabled ? Image.asset('assets/images/9.png', color: const Color.fromARGB(255, 255, 69, 0),) : Image.asset('assets/images/7.png', color: Colors.white60,), iconSize: 22),
                                    Text(
                                      post.upvotes.toString(),
                                      style: TextStyle(
                                        color: post.upVoteEnabled ? const Color.fromARGB(255, 255, 69, 0) : post.downVoteEnabled ? const Color.fromARGB(255, 113, 147, 225) : Colors.white60,
                                      ),
                                    ),
                                    IconButton(onPressed: downVote, icon: post.downVoteEnabled ? Image.asset('assets/images/10.png', color: const Color.fromARGB(255, 113, 147, 225),) : Image.asset('assets/images/8.png', color: Colors.white60,), iconSize: 22,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage(post)));}, icon: Image.asset('assets/images/11.png', color: Colors.white60,), iconSize: 21),
                                    IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CommunityPage()));}, icon: Image.asset('assets/images/11.png', color: Colors.white60,), iconSize: 21),
                                    Text(post.commentsNum.toString(), style: const TextStyle(color: Colors.white60,),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.arrowUpFromBracket, color: Colors.white60,), iconSize: 21),
                                    const Text('Share', style: TextStyle(color: Colors.white60,),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.gift, color: Colors.white60,), iconSize: 21),
                                    const Text('Award', style: TextStyle(color: Colors.white60,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  );
                }
              ),
            )
          ]
        )
      )
    );
  }

}