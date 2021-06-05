import 'package:flutter/material.dart';
import 'category-button.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              CategoryButton(),
              CategoryButton(),
              CategoryButton(),
              CategoryButton(),
            ],
          ),
          Row(
            children: [
              CategoryButton(),
              CategoryButton(),
              CategoryButton(),
              CategoryButton(),
            ],
          ),
        ],
      ),
    );
  }
}
