
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField{


  Widget InputText({textField, controller, isObsurce = false}){
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFF0E9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(
          color: Color(0xFF2E3E80),
          blurRadius: 10.0,
          offset: Offset(0,10),
        )]
      ),
      child: TextFormField(
        controller: controller,
        validator: (value){
          if(value!.isEmpty){
            return '$textField not filled';
          }
        },
        style: GoogleFonts.oswald(textStyle: const TextStyle(color: Colors.black),),
        obscureText: isObsurce,
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            hintText: textField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),

      ),
    );
  }

}