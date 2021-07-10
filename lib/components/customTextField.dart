import 'package:flutter/material.dart';
import 'package:souq/constants.dart';

class CustomTextField extends StatelessWidget {
  final bool obscure;
  final String heading;
  final String hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  final Icon icon;

  const CustomTextField(
      {this.labelText,
        this.icon,
      this.formKey,
      this.heading,
      this.hintText,
      this.obscure,
      this.onSaved,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Text(
              (heading == null ? "" : heading),
              style: TextStyle(color: Colors.grey.shade700),
            )),
        SizedBox(
          height: 10,
        ),
        Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            controller: controller,
            obscureText: obscure,
            // decoration: InputDecoration(
            //     hintText: hintText,
            //     hintStyle: TextStyle(color: Colors.grey),
            //     errorBorder: OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.red, width: 5))
            //
            //
            // ),
            decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(color: Colors.grey),
                hintText: hintText,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: icon ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(

                  borderSide: BorderSide(color: Colors.grey, ),
                  borderRadius: BorderRadius.circular(7),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.red, width: 0.9))),
          ),
        ),
      ],
    );
  }
}
