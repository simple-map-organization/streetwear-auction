import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  final String label;

  const CategoryButton({
    @required this.onPressed,
    @required this.icon,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Column(
          children: [
            icon,
            Text(label),
          ],
        ),
      ),
    );
  }
}
