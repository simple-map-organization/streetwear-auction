import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscured;
  final TextEditingController controller;

  const CustomTextField(
      {Key key, this.hintText, this.obscured, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (value) => (value == null || value.isEmpty)
            ? 'Please fill in this field.'
            : null,
        controller: controller,
        obscureText: obscured,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
            fillColor: Color.fromRGBO(235, 235, 235, 1),
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
            labelText: hintText,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 14)),
      ),
    );
  }
}
