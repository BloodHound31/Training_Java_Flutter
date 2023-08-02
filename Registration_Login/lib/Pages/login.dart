import 'dart:convert';

import 'package:flutter/material.dart';

import '../Service/user_data.dart';
import 'package:resgistration_login/UI/text_field.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  InputField iF = InputField();
  UserData user = UserData();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body:Container(
        padding: EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){Navigator.pushNamed(context, '/Home');},
                    icon: Icon(Icons.arrow_back, size: 30.0)),
                  SizedBox(width: 20),
                  Text(
                      'Welcome Back',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                  ),

                ],
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  iF.InputText(textField: 'EmailId', controller: _emailController),
                  SizedBox(height: 20),
                  iF.InputText(textField: 'Password', controller: _passwordController, isObsurce: true),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: (){

                      if (_formKey.currentState!.validate()) {
                        // Form is valid, perform your action here
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        user.login(email, password);
                        print('Form is valid');
                      } else {
                        // Form is invalid
                        print('Form is invalid');
                      }

                    },
                    child:Text('Submit', style: TextStyle(fontSize: 20.0),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
