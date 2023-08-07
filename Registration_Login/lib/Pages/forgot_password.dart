import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resgistration_login/CustomWidegts/custom_text_field.dart';

import '../Service/user_data.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}


class _ForgotPasswordState extends State<ForgotPassword> {

  InputField iF = InputField();
  UserData user = UserData();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff293772), Color(0xFF354899), Color(0xFF415ABF)],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 30.0),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Text(
                      "Change\nPassword",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1F2EB),
                    ),
                  ),
                ),
              ],//Row Children
            ),
            SizedBox(height: 30.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF8C9BDA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 100, left: 70, right: 70),
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            iF.InputText(textField: 'EmailId', controller: _emailController),
                            SizedBox(height: 20),
                            iF.InputText(textField: 'oldPassword', controller: _oldPasswordController, isObsurce: true),
                            SizedBox(height: 20.0),
                            iF.InputText(textField: 'newPassword', controller: _newPasswordController, isObsurce: true),
                            SizedBox(height: 25),
                            ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20.0, horizontal: 70)),
                                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0)
                                )),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff293772)),
                              ),
                              onPressed: (){

                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, perform your action here
                                  String email = _emailController.text;
                                  String oldPassword = _oldPasswordController.text;
                                  String newPassword = _newPasswordController.text;
                                  user.ChangePassword(email, oldPassword, newPassword, context);

                                } else {
                                  // Form is invalid
                                  user.ShowToast("SomeThing is missing");
                                }

                              },
                              child:Text('Change Password', style: TextStyle(fontSize: 16.0, color: Color(0xFFF1F2EB))),
                            ),
                          ],//ColumnChildren
                        ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
