import 'package:chat_app/components/communitiesList.dart';
import 'package:chat_app/models/Communities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Communities> communities = [
    Communities(title: "r/iran", detail: "", image: "images/userImage1.jpeg"),
    Communities(title: "r/reddit", detail: "", image: "images/userImage2.jpeg"),
    Communities(title: "r/flutter", detail: "", image: "images/userImage3.jpeg"),
    Communities(title: "r/ap", detail: "", image: "images/userImage4.jpeg"),
    Communities(title: "r/programming", detail: "", image: "images/userImage5.jpeg"),
    Communities(title: "r/project", detail: "", image: "images/userImage6.jpeg"),
    Communities(title: "r/SBU", detail: "", image: "images/userImage7.jpeg"),
    Communities(title: "r/national", detail: "?", image: "images/userImage8.jpeg"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 27,1) ,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,size: 20,),
                  filled: true,
                  fillColor: Color.fromRGBO(70, 72, 74,1),
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(30),

                  ),
                ),
              ),
            ),

            ListView.builder(
              itemCount:communities.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return communitiesList(
                  title: communities[index].title,
                  detail: communities[index].detail,
                  image: communities[index].image,
                 time: '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}