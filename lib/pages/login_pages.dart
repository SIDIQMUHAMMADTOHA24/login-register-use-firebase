import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project_fireabse/pages/forgot_password.dart';
import 'package:second_project_fireabse/pages/sign_pages.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key, required this.toSign});
  final VoidCallback toSign;

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  // !visibility password
  bool isVisibility = false;
  onVisibility() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  //! Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //! Login account
  final _auth = FirebaseAuth.instance;
  Future loginAccount() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      print('masuk');
    } catch (e) {
      print(e.toString());
      print('gagal masuk');
    }
  }

  //!disppose Contoller
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('We suggest using the email addreas you use at work',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                SizedBox(
                  height: 20,
                ),
                //! Email
                Row(
                  children: [
                    Text('Address Email *'),
                  ],
                ),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // ! password
                Row(
                  children: [
                    Text('Password *'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: isVisibility ? false : true,
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
                    suffixIcon: GestureDetector(
                        onTap: () => onVisibility(),
                        child: Icon(isVisibility
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          )),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => loginAccount(),
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
                SizedBox(
                  height: 25,
                ),
                Text('OR',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset('assets/icon/google.png', width: 23),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text('Continue with google',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset('assets/icon/fb.png', width: 23),
                      SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text('Continue with facebook',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You don\'t haven account yet ?',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: widget.toSign,
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
