import 'package:flutter/material.dart';

class DropDownList extends StatelessWidget {
  DropDownList(this.dropdownValue, this.onChange, this.selection);

  final Function onChange;

  final String dropdownValue;
  final List<String> selection;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 12.0, right: 0, top: 1.5, bottom: 1.5),
        margin: EdgeInsets.only(right: 5, bottom: 7),
        decoration: ShapeDecoration(
          color: Color.fromRGBO(235, 235, 235, 1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: Color.fromRGBO(235, 235, 235, 1)),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
        child: DropdownButton<String>(
          value: dropdownValue,
          isExpanded: true,
          isDense: true,
          underline: Container(
            height: 0,
          ),
          onChanged: onChange,
          items: selection.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
        ));
  }
}
