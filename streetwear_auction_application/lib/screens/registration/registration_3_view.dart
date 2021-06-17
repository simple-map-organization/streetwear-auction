import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../widgets/custom_authetication_button.dart';
import '../view.dart';
import 'registration_viewmodel.dart';
import 'verification_view.dart';

class RegistrationScreen3 extends StatelessWidget {
  static const routeName = '/registration_3';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => RegistrationScreen3());
  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<RegistrationViewModel>(),
      builder: (context, viewmodel, _) => Scaffold(
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          body: Stack(children: [
            Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
            Column(children: [
              Container(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  height: 200,
                  child: Image.asset(
                    'assets/img/logo-01.png',
                  ),
                ),
              ),
              Text(
                'Registration',
                style: TextStyle(fontSize: 30),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.check,
                          color: Colors.lightGreenAccent[400],
                        )),
                    Expanded(
                        flex: 7,
                        child: Text('Front view of the IC/Passport/License',
                            style: TextStyle(fontSize: 14)))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.check,
                          color: Colors.lightGreenAccent[400],
                        )),
                    Expanded(
                        flex: 7,
                        child: Text('Back view of the IC/Passport/License',
                            style: TextStyle(fontSize: 14)))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 29, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.check,
                          color: Colors.lightGreenAccent[400],
                        )),
                    Expanded(
                        flex: 7,
                        child: Text(
                            'A selfie of yourself holding your IC/Passport/Licence with a piece of paper writing today\'s date and \"SWA registration\"',
                            style: TextStyle(fontSize: 14)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 29,
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Checkbox(
                              value: viewmodel.isChecked,
                              onChanged: (value) {
                                viewmodel.setIsChecked();
                              })),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'I acknowledge that I have read, and do hereby accept the Terms and Conditions by the Streetwear Acution Application'),
                            InkWell(
                              child: Text(
                                'Read Terms and Conditions',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: CustomAuthenticationButton(
                    text: 'Register',
                    onPressed: viewmodel.isChecked
                        ? () async {
                            await viewmodel.register().then((value) => value
                                ? Navigator.pushNamed(
                                    context, VerificationScreen.routeName)
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'We have encountered some problem. Please try again'))));
                          }
                        : null),
              ),
            ]),
          ])),
    );
  }
}
