import 'package:flutter/material.dart';

import '../Service/user_data.dart';
import 'package:resgistration_login/CustomWidegts/custom_text_field.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  InputField iF = InputField();
  UserData user = UserData();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff293772), Color(0xFF354899), Color(0xFF415ABF)],
          ),
        ),
        padding: const EdgeInsets.only( top: 100.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                      'Welcome\nBack',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1F2EB),
                    )
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
           Expanded(
             child: Container(

               decoration: const BoxDecoration(
                 color: Color(0xFF8C9BDA),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
               ),
               child: SingleChildScrollView(
                 child: Form(
                   key: _formKey,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 70),
                     child: Column(
                       children: [
                         const SizedBox(height: 80),
                         iF.InputText(textField: 'EmailId', controller: _emailController),
                         const SizedBox(height: 20),
                         iF.InputText(textField: 'Password', controller: _passwordController, isObsurce: true),
                         const SizedBox(height: 20),
                         TextButton(
                           onPressed: (){
                             Navigator.pushNamed(context, '/ForgotPassword');
                           },
                           child:const Text('Forgot Password?', style: TextStyle(fontSize: 18.0, color: Color(0xFF354899)),),
                         ),
                         ElevatedButton(
                           style: ButtonStyle(
                             padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 18.0, horizontal: 70)),
                             shadowColor: MaterialStateProperty.all<Color>(const Color(0xFF6E81CE)),
                             shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(60.0)
                             )),
                             backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff293772)),
                           ),
                           onPressed: (){

                             if (_formKey.currentState!.validate()) {
                               // Form is valid, perform your action here
                               String email = _emailController.text;
                               String password = _passwordController.text;
                               user.login(email, password, context);

                             } else {
                               // Form is invalid
                               user.ShowToast("SomeThing is missing");
                             }

                           },
                           child:const Text('Submit', style: TextStyle(fontSize: 20.0, color: Color(0xFFF1F2EB)),),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
