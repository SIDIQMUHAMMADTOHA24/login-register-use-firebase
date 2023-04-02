import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../databse/firebase_databse.dart';
import '../utils/confirm_second_password_utils.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({super.key, required this.toLogin});

  final VoidCallback toLogin;

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  // !visibility password
  bool isVisibility = false;
  onVisibility() {
    isVisibility = !isVisibility;
    setState(() {});
  }

  //! Controller
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //!confirm password
  bool onConfirm() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      print('berhasil masuk');
      return true;
    }
    print('password yang anda masukan salah');
    return false;
  }

  //! create new account and add in database
  final _auth = FirebaseAuth.instance;
  Future createAccount() async {
    try {
      if (onConfirm()) {
        await _auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        FirebaseDatabase().database(
            userName: userNameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        print('masuk ke account $emailController');
      }
    } catch (e) {
      print(e.toString());
      print('gagal masuk');
    }
  }

  //!disppose Contoller
  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Create your account before having fun',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              SizedBox(
                height: 20,
              ),
              //! Username
              Row(
                children: [
                  Text('User Name'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //! Email
              Row(
                children: [
                  Text('Address Email'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // ! password
              Row(
                children: [
                  Text('Password'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SecondPasswprd(
                isVisibility: isVisibility,
                textEditingContoller: passwordController,
              ),
              SizedBox(
                height: 10,
              ),
              // ! Confirm password
              Row(
                children: [
                  Text('Confirm Password'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SecondPasswprd(
                isVisibility: isVisibility,
                textEditingContoller: confirmPasswordController,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  createAccount();
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500))),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You already have an account?',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: widget.toLogin,
                    child: Text('Login',
                        style: TextStyle(
                            color: Colors.blue[600],
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
