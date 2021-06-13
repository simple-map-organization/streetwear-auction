import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/auth.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/nav_bar_wrapper.dart';
import 'package:streetwear_auction_application/screens/login/login_view.dart';

class AuthWrapper extends StatelessWidget {
  static MaterialPageRoute createRoute() =>
      MaterialPageRoute(builder: (_) => AuthWrapper());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dependency<AuthService>().isLoggedIn(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          //if not logged in
          if (!snapshot.data) {
            return LoginScreen();
          } else {
            return NavBarWrapper();
          }
        });
  }
}
