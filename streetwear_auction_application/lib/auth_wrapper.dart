import 'package:flutter/material.dart';
import 'app/auth.dart';
import 'app/dependencies.dart';
import 'nav_bar_wrapper.dart';
import 'screens/login/login_view.dart';

class AuthWrapper extends StatelessWidget {
  static final routeName = '/auth';
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
