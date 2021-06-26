import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(BuildContext) onPressSearchBar;

  const SearchBar({Key key, this.onPressSearchBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.resolveWith((_) => Colors.white),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Search product',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                onPressed: () => onPressSearchBar(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 20.0,
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, '/notification');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
