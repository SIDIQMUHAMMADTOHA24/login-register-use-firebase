import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DasboardPages extends StatelessWidget {
  DasboardPages({super.key});

  //! logout
  Future logoutAccount() async {
    await FirebaseAuth.instance.signOut();
  }

  //! user
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Congratulations',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                  'Holla ${user!.email}, welcome to our application, this application is being developed Stay tuned for further updates'),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => logoutAccount(),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  )),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
