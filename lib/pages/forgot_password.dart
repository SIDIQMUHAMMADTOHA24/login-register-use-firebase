import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  //! controller
  final emailController = TextEditingController();

  //! reset password
  final _auth = FirebaseAuth.instance;
  Future resetPassword(BuildContext ctx) async {
    await _auth.sendPasswordResetEmail(email: emailController.text.trim());
    showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          content: Text('Send succes, please back end open email now'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Reset Password',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  'We will send you a link that will be forwarded to WEB to change your password '),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  suffixIconColor: Colors.green,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              InkWell(
                onTap: () {
                  resetPassword(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500))),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
