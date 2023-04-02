import 'package:flutter/material.dart';

class SecondPasswprd extends StatefulWidget {
  SecondPasswprd({
    super.key,
    required this.isVisibility,
    required this.textEditingContoller,
  });

  // !isVisible
  late bool isVisibility;
  final TextEditingController textEditingContoller;

  @override
  State<SecondPasswprd> createState() => _SecondPasswprdState();
}

class _SecondPasswprdState extends State<SecondPasswprd> {
  // ! change Obscure Text
  onChange() {
    widget.isVisibility = !widget.isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingContoller,
      obscureText: widget.isVisibility ? false : true,
      decoration: InputDecoration(
        suffixIconColor: Colors.green,
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: GestureDetector(
            onTap: () => onChange(),
            child: Icon(
                widget.isVisibility ? Icons.visibility_off : Icons.visibility)),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
