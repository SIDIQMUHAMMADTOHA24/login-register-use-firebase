import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_project_fireabse/pages/dasbord.dart';
import 'package:second_project_fireabse/pages/login_pages.dart';
import 'package:second_project_fireabse/pages/select_pages/sign_or_login.dart';

class CheckAccount extends StatefulWidget {
  const CheckAccount({super.key});

  @override
  State<CheckAccount> createState() => _CheckAccountState();
}

class _CheckAccountState extends State<CheckAccount> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DasboardPages();
        } else {
          return SelectSignLogin();
        }
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    );
  }
}
