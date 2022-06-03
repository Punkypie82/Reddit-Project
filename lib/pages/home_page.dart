import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:reddit/pages/comments_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Post.dart';
import '../comment.dart';

class RedditHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RedditHomePageState();
}

class RedditHomePageState extends State {

  bool value(bool boolean) {return boolean;}

  downVote(bool upVote, bool downVote) {
    setState(() {
      downVote ? downVote = false : downVote = true;
      if (upVote && downVote) upVote = false;
    });
  }

  Comment comment = Comment('https://external-preview.redd.it/1mF2BkbuRUyI5Od8V7aTZDVS_Y8-GMWeT4zvv7e_IrI.jpg?auto=webp&s=6dd561c5c1c1d69de69a56c8afaf4d5e3269d537', "Rashin Rahnamun", '34m', 'wow this is awsome!!');
  late Post post = Post('https://external-preview.redd.it/1mF2BkbuRUyI5Od8V7aTZDVS_Y8-GMWeT4zvv7e_IrI.jpg?auto=webp&s=6dd561c5c1c1d69de69a56c8afaf4d5e3269d537', "https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?k=20&m=1093110112&s=612x612&w=0&h=3OhKOpvzOSJgwThQmGhshfOnZTvMExZX2R91jNNStBY=", 'r/gifs', 'u/Amirhossein', '19h', 'Beautiful green walkway.', 'Nice beautiful day in nature.', comment);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        downVote() {
          setState(() {
            post.downVoteEnabled ? post.downVoteEnabled = false : post.downVoteEnabled = true;
            if (post.upVoteEnabled && post.downVoteEnabled) post.upVoteEnabled = false;
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
                        IconButton(onPressed: () {post.upChanger(); if (post.upVoteEnabled && post.downVoteEnabled) post.downChanger(); setState(() {});}, icon: post.upVoteEnabled ? Image.asset('assets/images/9.png', color: const Color.fromARGB(255, 255, 69, 0),) : Image.asset('assets/images/7.png', color: Colors.white60,), iconSize: 22),
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
    );
  }
}
