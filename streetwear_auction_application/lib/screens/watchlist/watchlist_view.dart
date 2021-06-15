import 'package:flutter/material.dart';

class WatchListScreen extends StatelessWidget {
  static const routeName = '/watchlist';
  static Route<dynamic> createRoute() =>
      MaterialPageRoute(builder: (_) => WatchListScreen());

  const WatchListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Under  construction'),
    );
  }
}
