import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
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
              SizedBox(width: 5,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("About us",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 15),),
                  ],
                ),
              ),





            ],
          ),
        ),
      ),
    ),
    body:

      //mainAxisAlignment: MainAxisAlignment.center,
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset(
          '../lib/images/sbu-logomark-logo.png',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),

    Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(
            top:30 ,  bottom: 5, left: 80, right: 40),
        child:   Text("This is Reddit project for AP Spring 1401 made by Amirhossein kanani and Rashin Rahnamoun",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 13,)),
      ),
    ),
    ],
    ),
  );




}
