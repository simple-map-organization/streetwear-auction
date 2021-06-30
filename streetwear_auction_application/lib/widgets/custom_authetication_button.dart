import 'package:flutter/material.dart';

class CustomAuthenticationButton extends StatelessWidget {
  final String text;
  final onPressed;
  const CustomAuthenticationButton({Key key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: Colors.transparent))),
          backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(118, 166, 208, 1))),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
