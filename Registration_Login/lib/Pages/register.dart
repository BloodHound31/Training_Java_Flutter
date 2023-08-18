import 'package:flutter/material.dart';

import '../Service/user_data.dart';
import 'package:resgistration_login/CustomWidegts/custom_text_field.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  InputField iF = InputField();

  UserData user = UserData();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff293772), Color(0xFF354899), Color(0xFF415ABF)],
          ),
        ),
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 60,
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
                //margin: EdgeInsets.symmetric(horizontal: 40),
                child: Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 70),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          iF.InputText(textField: 'username', controller: _userNameController),
                          const SizedBox(height: 20),
                          iF.InputText(textField: 'EmailId', controller: _emailController),
                          const SizedBox(height: 20),
                          iF.InputText(textField: 'Password', controller: _passwordController, isObsurce: true),
                          const SizedBox(height: 20),
                          iF.InputText(textField: 'details', controller: _detailsController),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60.0)
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff293772)),
                            ),
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                //Form is Valid
                                String userName = _userNameController.text;
                                String email = _emailController.text;
                                String password = _passwordController.text;
                                String details = _detailsController.text;
                                user.Register(userName, email, password, details, context);
                              } else {
                                // Form is invalid
                                user.ShowToast("SomeThing is missing");
                              }

                            },
                            child:const Text('Submit', style: TextStyle(fontSize: 20.0, color: Color(0xFFF1F2EB)),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],//Children
        ),
      ),
    );
  }//Build
}//Class
