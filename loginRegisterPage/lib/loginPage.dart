import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registerPage.dart';
import 'inputStyle.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool _isObscure = true;
  late String name,email,phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 10.0 , right: 10,bottom:30),child: SizedBox(
        width: 200,
        height: 50,
        child: RaisedButton(
          color: Color.fromRGBO(255, 69, 0,1),
          onPressed: (){

            if(_formkey.currentState!.validate())
            {
              print("successful");

              return;
            }else{
              print("UnSuccessfull");
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),

          ),
          textColor:Colors.white,child: Text("Continue"),

        ),
      ),
      ),
      backgroundColor: Color.fromRGBO(3, 3, 3,1),
      body: Center(
        child: SingleChildScrollView(

          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(
                  'reddit-logomark-logo.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),

                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:5,left: 10,right: 10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: inputStyle(Icons.person,"Username"),
                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please Enter Username';
                      }
                      return null;
                    },
                    onSaved: (value){
                      name = value!;
                    },
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: _isObscure,


                    controller: password,
                    keyboardType: TextInputType.text,
                   // decoration:buildInputDecoration(Icons.lock,"Password"),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(38, 36, 36,1),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility : Icons.visibility_off),
                            color: Colors.grey.shade400,
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(3, 3, 3,1),
                              width: 1.5
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(3, 3, 3,1),
                            width: 1.5,
                          ),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(3, 3, 3,1),
                            width: 1.5,
                          ),
                        ),
                      ),



                    validator: ( value){
                      if(value!.isEmpty)
                      {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },

                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",style: TextStyle(color: Colors.white),

                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => FormPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',style: TextStyle(color: Color.fromRGBO(255, 69, 0,1),)

                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
