// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoFd extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const TodoFd({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: hintText,
              labelText: "Todo",
            ),
          ),
        ),
      ),
    );
  }
}
