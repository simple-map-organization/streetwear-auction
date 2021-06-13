import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscured;
  final bool enabled;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomTextField(
      {Key key,
      this.hintText,
      this.obscured = false,
      this.controller,
      this.enabled = true,
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: inputType,
        enabled: enabled,
        validator: enabled
            ? (value) {
                if ((value == null || value.isEmpty))
                  return 'This field cannot be empty.';
                else {
                  if (inputType == TextInputType.emailAddress &&
                      !EmailValidator.validate(value)) {
                    return 'The email format is incorrect.';
                  }
                }
                return null;
              }
            : null,
        controller: controller,
        obscureText: obscured,
        decoration: InputDecoration(
            counterText: ' ',
            contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            fillColor:
                enabled ? Color.fromRGBO(235, 235, 235, 1) : Colors.grey[400],
            filled: true,
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            labelText: hintText,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
      ),
    );
  }
}
