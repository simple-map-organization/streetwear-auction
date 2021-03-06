import 'package:flutter/material.dart';

class SellerProductSearchBar extends StatelessWidget {
  final Function(BuildContext) onPressSearchBar;

  const SellerProductSearchBar({Key key, this.onPressSearchBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(8.0),
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
                  size: 24.0,
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
