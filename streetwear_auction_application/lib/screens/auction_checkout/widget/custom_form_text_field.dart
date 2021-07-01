import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final Function validator;
  final TextEditingController controller;
  final String label;
  CustomFormTextField(this.validator, this.controller, this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 12.0),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(10.0),
          isCollapsed: true,
        ),
      ),
    );
  }
}
