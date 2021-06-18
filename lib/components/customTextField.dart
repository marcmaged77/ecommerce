


import 'package:flutter/material.dart';




class CustomTextField extends StatelessWidget {

  final bool obscure;
  final String heading;
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  const CustomTextField({
     this.heading,
     this.hintText,
     this.obscure,
     this.onSaved,
      this.validator,
     this.controller

  }) ;

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              heading,
              style: TextStyle(color: Colors.grey.shade700),
            )),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          controller:controller ,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}