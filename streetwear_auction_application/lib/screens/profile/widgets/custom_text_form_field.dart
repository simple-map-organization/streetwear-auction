import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String initialValue;
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final int maxLength;
  final bool isNumber;
  const CustomTextFormField(
      {Key key,
      this.initialValue,
      this.hintText,
      this.controller,
      this.readOnly,
      this.maxLength,
      this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.0),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        maxLength: maxLength,
        keyboardType: isNumber
            ? TextInputType.number
            : maxLength < 500
                ? TextInputType.text
                : TextInputType.multiline,
        maxLines: maxLength < 500 ? 1 : 5,
        inputFormatters: [
          isNumber
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        style: TextStyle(fontSize: 12.0),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          counterText: "",
          isDense: true,
          contentPadding: EdgeInsets.all(12.0),
          fillColor: Color.fromRGBO(235, 235, 235, 1),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
