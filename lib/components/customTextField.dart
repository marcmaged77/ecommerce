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

  const CustomTextField(
      {this.labelText,
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
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(7),
                ),
                // focusedBorder: OutlineInputBorder(
                //
                //   borderSide: BorderSide(color: kPrimaryColor),
                //   borderRadius: BorderRadius.circular(7),
                // ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
      ],
    );
  }
}
