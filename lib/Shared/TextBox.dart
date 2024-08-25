import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final IconData prefixIcon;
  final hintText;
  final bool isPwd;

  TextBox(this.prefixIcon, this.hintText, this.isPwd, {required TextEditingController controller, required Null Function(dynamic text) onChanged});

  @override
  Widget build(BuildContext context) {
    return  TextField(
        obscureText: isPwd,
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            border:OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}