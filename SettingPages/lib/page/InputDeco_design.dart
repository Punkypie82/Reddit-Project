import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    filled: true,
    fillColor: Color.fromRGBO(38, 36, 36,1),
    hintText: hinttext,
    hintStyle: TextStyle(color: Colors.grey.shade400),
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
  );
}