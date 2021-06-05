import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String _label;
  final bool _isSelected;
  final Function _onSelected;

  const CategoryButton(this._label, this._isSelected, this._onSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilterChip(
        selected: _isSelected,
        onSelected: _onSelected,
        backgroundColor: Colors.white,
        selectedColor: Colors.white,
        label: Text(_label),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color:
                  _isSelected ? Theme.of(context).primaryColor : Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
