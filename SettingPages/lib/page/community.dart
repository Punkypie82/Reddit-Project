import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'InputDeco_design.dart';

class community extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(

    backgroundColor:Colors.black,
        appBar: AppBar(

          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[

                  SizedBox(width: 2,),

                  SizedBox(width: 60,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Create a community",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white,fontSize: 15),),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
    body:

    Container(

      child: Form(
        key: _formkey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top:10 ,  bottom: 5, left: 20, right: 10),
                child:   Text("Edit your information",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15,)),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 5, left: 10, right: 10),

              child: TextFormField(

                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                decoration:
                InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(38, 36, 36,1),
                hintText: "r/yourCommunity",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(3, 3, 3,1),
                      width: 1.5
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(3, 3, 3,1),
                    width: 1.5,
                  ),
                ),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(3, 3, 3,1),
                    width: 1.5,
                  ),
                ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Community Name';
                  }
                  return null;
                },
                onSaved: (value) {
                  var name = value!;
                },
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top:10 ,  bottom: 5, left: 20, right: 10),
                child:   Text("Community type",textAlign: TextAlign.left,style: TextStyle(color: Colors.white,fontSize: 15,)),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top:10 ,  bottom: 5, left: 20, right: 10),
                child:   Text("Anyone can view,post, and comment to this community",textAlign: TextAlign.left,style: TextStyle(color: Colors.white54,fontSize: 13,)),
              ),
            ),
        Padding(
          padding: const EdgeInsets.only(
              top:15 ,  bottom: 5, left: 20, right: 10),
          child:
          SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    print("successful");

                    return;
                  } else {
                    print("UnSuccessfull");
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),

                ),
                textColor: Colors.white,
                child: Text("Create community",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 16),),

              ),
            ),
        ),




          ],
        ),
      ),

    ),

      );
}
