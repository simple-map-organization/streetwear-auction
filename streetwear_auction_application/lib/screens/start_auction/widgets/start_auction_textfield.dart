import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartAuctionTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const StartAuctionTextField({Key key, this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: (hintText == 'BIN' ||
                hintText == 'Starting Price' ||
                hintText == 'Min Increment' ||
                hintText == 'Delivery Fee')
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.name,
        inputFormatters: [
          (hintText == 'BIN' ||
                  hintText == 'Starting Price' ||
                  hintText == 'Min Increment' ||
                  hintText == 'Delivery Fee')
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$'))
        ],
        validator: (value) => (value == null || value.isEmpty)
            ? 'Please fill in this field.'
            : null,
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            hintText: hintText,
            fillColor: Color.fromRGBO(235, 235, 235, 1),
            filled: true),
      ),
    );
  }
}
