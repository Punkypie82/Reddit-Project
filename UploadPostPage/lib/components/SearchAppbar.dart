import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromRGBO(26, 26, 27,1),

      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                  //avaz
                },
                icon: Icon(Icons.arrow_back,color: Colors.white,),
              ),
              SizedBox(width: 2,),
              CircleAvatar(
                backgroundImage: AssetImage("images/userImage1.jpeg"),
                maxRadius: 12,
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("r/nasa",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}