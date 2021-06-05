import 'package:flutter/material.dart';
import 'category-button.dart';

class Categories extends StatelessWidget {
  final Function onSelectCategory;
  final categories = const [
    {'label': 'Sneaker', 'icon': Icon(Icons.ac_unit)},
    {'label': 'Cap', 'icon': Icon(Icons.ac_unit)},
    {'label': 'Shirt', 'icon': Icon(Icons.ac_unit)},
    {'label': 'Sneakers', 'icon': Icon(Icons.ac_unit)},
  ];

  const Categories({Key key, this.onSelectCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories
            .map((category) => CategoryButton(
                  icon: category['icon'],
                  label: category['label'],
                  onPressed: () => onSelectCategory(context, category['label']),
                ))
            .toList(),
      ),
    );
  }
}
