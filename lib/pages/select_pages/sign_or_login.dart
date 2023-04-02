import 'package:flutter/src/widgets/framework.dart';
import 'package:second_project_fireabse/pages/login_pages.dart';
import 'package:second_project_fireabse/pages/sign_pages.dart';

class SelectSignLogin extends StatefulWidget {
  const SelectSignLogin({super.key});

  @override
  State<SelectSignLogin> createState() => _SelectSignLoginState();
}

class _SelectSignLoginState extends State<SelectSignLogin> {
  bool isSelect = true;

  onSelect() {
    isSelect = !isSelect;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSelect) {
      return LoginPages(
        toSign: () => onSelect(),
      );
    }
    return SignUpPages(
      toLogin: () => onSelect(),
    );
  }
}
