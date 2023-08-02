import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField{


  Widget InputText({textField, controller, isObsurce = false}){
    return TextFormField(
      controller: controller,
      validator: (value){
        if(value!.isEmpty){
          return '$textField not filled';
        }
      },
      style: TextStyle(color: Colors.black),
      obscureText: isObsurce,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: textField,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),

    );
  }

}