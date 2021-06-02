import 'package:flutter/material.dart';




class CustomTextField extends StatelessWidget {

  final bool obscure;
  final String heading;
  final String hintText;


  const CustomTextField({
    Key? key,
    required this.heading,
    required this.hintText,
    required this.obscure

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              heading,
              style: TextStyle(color: Colors.grey.shade700),
            )),
        TextFormField(
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}