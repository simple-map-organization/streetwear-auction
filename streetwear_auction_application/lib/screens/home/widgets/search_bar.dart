import 'package:flutter/material.dart';
// import '../../search_auction/search_auction_view.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
                onPressed: null,
                // onPressed: () => Navigator.of(context).pushNamed(
                //       SearchAuctionScreen.routeName,
                //     ),
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
