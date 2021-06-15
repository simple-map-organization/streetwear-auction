import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../widgets/custom_authetication_button.dart';
import '../view.dart';
import 'registration_viewmodel.dart';

class RegistrationScreen2 extends StatelessWidget {
  static const routeName = '/registration_2';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => RegistrationScreen2());
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
            Column(
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
                  'Registration',
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                      'Hereby, you have to provide 3 photos for the prove of your identity: \n\n' +
                          '1. Front view of the IC/Passport/License\n\n' +
                          '2. Back view of the IC/Passport/License\n\n' +
                          '3. A selfie of yourself holding your IC/Passport/Licence with a piece of paper writing today\'s date and \"SWA registration\"',
                      style: TextStyle(fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      '*Make sure the photos taken are clear, so that your face and name are both clear and legible.',
                      style: TextStyle(fontSize: 12, color: Colors.red)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomAuthenticationButton(
                          text: 'Take Photo',
                          onPressed: () async {
                            final pickedFile = await viewmodel.chooseImage();
                            if (pickedFile != null)
                              Navigator.pushNamed(context, '/registration_3');
                          })
                    ],
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
