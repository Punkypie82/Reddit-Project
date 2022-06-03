import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:reddit/Post.dart';

import '../comment.dart';

class CommentsPage extends StatefulWidget {

  final Post post;

  CommentsPage(this.post);

  @override
  State<StatefulWidget> createState() => CommentsPageState(post);
}

class CommentsPageState extends State<CommentsPage> {

  final Post post;
  CommentsPageState(this.post);
  Comment comment = Comment('https://external-preview.redd.it/1mF2BkbuRUyI5Od8V7aTZDVS_Y8-GMWeT4zvv7e_IrI.jpg?auto=webp&s=6dd561c5c1c1d69de69a56c8afaf4d5e3269d537', "Rashin Rahnamun", '34m', 'wow this is awsome!!');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: const [
            Padding(padding: EdgeInsets.only(top: 5.0), child: IconButton(onPressed: null, icon: Icon(Icons.notifications_none_outlined, color: Colors.white60,))),
            Padding(padding: EdgeInsets.only(top: 5.0), child: IconButton(onPressed: null, icon: Icon(Icons.more_horiz, color: Colors.white60,))),
          ],
        )
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return index == 0 ?
            Container(
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
                            ),
                          ],
                        ),
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
                            IconButton(onPressed: () {setState(() {post.upChanger(); if (post.upVoteEnabled && post.downVoteEnabled) post.downChanger();});}, icon: post.upVoteEnabled ? Image.asset('assets/images/9.png', color: const Color.fromARGB(255, 255, 69, 0),) : Image.asset('assets/images/7.png', color: Colors.white60,), iconSize: 22),
                            Text(
                              post.upvotes.toString(),
                              style: TextStyle(
                                color: post.upVoteEnabled ? const Color.fromARGB(255, 255, 69, 0) : post.downVoteEnabled ? const Color.fromARGB(255, 113, 147, 225) : Colors.white60,
                              ),
                            ),
                            IconButton(onPressed: () {setState(() {post.downChanger(); if (post.upVoteEnabled && post.downVoteEnabled) post.upChanger();});}, icon: post.downVoteEnabled ? Image.asset('assets/images/10.png', color: const Color.fromARGB(255, 113, 147, 225),) : Image.asset('assets/images/8.png', color: Colors.white60,), iconSize: 22,),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(right: 8.0), child: Image.asset('assets/images/11.png', color: Colors.white60),),
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
            ) :
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            Container(
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
                                      image: NetworkImage(comment.profilePictureUrl)
                                  )
                              ),
                            ),
                            Text(comment.name + " • " + comment.date, style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.w300))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 10.0),
                    child: Linkify(
                      onOpen: (link) async {
                        if (await canLaunch(link.url)) {
                          await launch(link.url);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: comment.commentText,
                      style: const TextStyle(color: Color.fromARGB(255, 215, 218, 220), fontWeight: FontWeight.w300, fontSize: 13.0),
                      linkStyle: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 20.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: Colors.white60,), iconSize: 21),
                        IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.gift, color: Colors.white60,), iconSize: 21),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(3.141592653589793),
                                  child: const Icon(FontAwesomeIcons.share, color: Colors.white60,),
                                ),
                                iconSize: 21
                            ),
                            const Text('Reply', style: TextStyle(color: Colors.white60,),),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: () {setState(() {comment.upChanger(); if (comment.upVoteEnabled && comment.downVoteEnabled) comment.downChanger();});}, icon: comment.upVoteEnabled ? Image.asset('assets/images/9.png', color: const Color.fromARGB(255, 255, 69, 0),) : Image.asset('assets/images/7.png', color: Colors.white60,), iconSize: 22),
                            Text(
                              comment.upvotes.toString(),
                              style: TextStyle(
                                color: comment.upVoteEnabled ? const Color.fromARGB(255, 255, 69, 0) : comment.downVoteEnabled ? const Color.fromARGB(255, 113, 147, 225) : Colors.white60,
                              ),
                            ),
                            IconButton(onPressed: () {setState(() {comment.downChanger(); if (comment.upVoteEnabled && comment.downVoteEnabled) comment.upChanger();});}, icon: comment.downVoteEnabled ? Image.asset('assets/images/10.png', color: const Color.fromARGB(255, 113, 147, 225),) : Image.asset('assets/images/8.png', color: Colors.white60,), iconSize: 22,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            );
        }
      )
    );
  }
}