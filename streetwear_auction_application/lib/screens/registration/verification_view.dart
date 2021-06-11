import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/screens/login/login_view.dart';
import 'package:streetwear_auction_application/widgets/custom_authetication_button.dart';

class VerificationScreen extends StatelessWidget {
  static const routeName = '/verification';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => VerificationScreen());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
        body: Column(
          children: [
            Container(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Container(
                height: 150,
                child: Image.asset(
                  'assets/img/logo-01.png',
                ),
              ),
            ),
            Text(
              'Verification Pending',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 20),
              child: Text(
                'Thank you! Please allow 2 - 3 business day to process your application. You will be notified via email\n\n' +
                    'We are experiencing high application volumes. It may take longer than usual to process your application.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            CustomAuthenticationButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (route) => false);
                })
          ],
        ));
  }
}
