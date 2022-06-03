import 'package:chat_app/modules/UploadPostPage.dart';
import 'package:flutter/material.dart';

class communitiesList extends StatefulWidget{
  String title;
  String detail;
  String image;
  String time;
  communitiesList({required this.title,required this.detail,required this.image,required this.time,});
  @override
  _communitiesListState createState() => _communitiesListState();
}

class _communitiesListState extends State<communitiesList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return UploadPostPage();

          //inja bas routing avaz she be shekl kanani  avaz
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 15,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,style: TextStyle( fontWeight: FontWeight.w400,color: Colors.white)),
                          //SizedBox(height: 6,),
                          //Text(widget.secondaryText,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,color:Colors.grey.shade500),),
          ],
        ),
      ),
    );
  }
}