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
            : TextInputType.text,
        inputFormatters: [
          (hintText == 'BIN' ||
                  hintText == 'Starting Price' ||
                  hintText == 'Min Increment' ||
                  hintText == 'Delivery Fee')
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
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
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            hintText: hintText,
            fillColor: Color.fromRGBO(235, 235, 235, 1),
            filled: true),
      ),
    );
  }
}
