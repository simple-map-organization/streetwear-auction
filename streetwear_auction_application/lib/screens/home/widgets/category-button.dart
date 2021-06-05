import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
            Text('Sneakers'),
          ],
        ),
      ),
    );
  }
}
