import 'package:chat_app/components/SearchAppbar.dart';
import 'package:chat_app/models/Items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CommunitySearch.dart';




class UploadPostPage extends StatefulWidget{
  @override
  _UploadPostPageState createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {



  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
      return Scaffold(
         backgroundColor:Color.fromRGBO(26, 26, 27,1),
      appBar: SearchAppbar(),
      bottomNavigationBar:   BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(26, 26, 27,1),
        selectedItemColor:  Color.fromRGBO( 215, 218, 220,1),
        unselectedItemColor:  Color.fromRGBO( 129, 131, 132,1),
        selectedFontSize: 5,
        unselectedFontSize: 5,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.text_snippet_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.add_link),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.image),
          ),

        ],
      ),
      body:Container(

       color: Color.fromRGBO(26, 26, 27,1),
      child: SingleChildScrollView(
      child: Form(
      key: _formkey2,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [




   TextFormField(
            maxLines: null,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
    style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
            // expands: true,
            // keyboardType: TextInputType.multiline,
            decoration: InputDecoration(

              hintText: "Add title "
                 ,
              hintStyle: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.bold,fontSize: 17),
              filled: true,
              fillColor:  Color.fromRGBO(29, 30, 31,1),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color:  Color.fromRGBO(29, 30, 31,1)
                  )
              ),
            ),
          ),
        SizedBox(
          height: 15,
        ),

        TextFormField(
          style: TextStyle(color: Colors.white),
          maxLines: null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          // expands: true,
          // keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: "Add text ...\n"
                "\n"
                "\n"
                "\n"
                "\n"
                "\n "
            ,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor:  Color.fromRGBO(26, 26, 27,1),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color:  Color.fromRGBO(26, 26, 27,1)
                )
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),


        InkWell(
          borderRadius:BorderRadius.circular(25) ,
          onTap: () {
    if (_formkey2.currentState!.validate()) {
      //style: TextStyle(color: Colors.blue.withOpacity(0.8), fontSize: 15)
      Navigator.push(
        context,
        CupertinoPageRoute(
          //avaz
          builder: (context) => ChatPage(),
        ),
      );
    }

          },
          child: Text( "Next", textAlign: TextAlign.center,

            style: TextStyle(color: Colors.blueAccent, fontSize: 15,),),


        ),


],
      ),
      ),
      ),

      ),


      );

  }
}