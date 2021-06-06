import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/login/login_viewmodel.dart';
import 'package:streetwear_auction_application/screens/view.dart';
import 'package:streetwear_auction_application/widgets/custom_authetication_button.dart';
import 'package:streetwear_auction_application/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<LoginViewModel>()..init(),
      builder: (context, viewmodel, _) => Scaffold(
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Container()),
            Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                child: Container(
                  height: 30,
                  // child: Image.asset(
                  //   'assets/img/logo-01.png',
                  // ),
                )),
            Form(
                key: viewmodel.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 29, right: 29, bottom: 21),
                      child: CustomTextField(
                          hintText: 'username/email',
                          obscured: false,
                          controller: viewmodel.usernameController),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 29, right: 29, bottom: 9),
                      child: CustomTextField(
                          hintText: 'password',
                          obscured: true,
                          controller: viewmodel.passwordController),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 36),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          child: new Text('Register Now'),
                          onTap: () {
                            Navigator.pushNamed(context, '/registration_1');
                          },
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 27),
                        child: Align(
                          alignment: Alignment.center,
                          child: CustomAuthenticationButton(
                              text: 'Login',
                              onPressed: () async {
                                if (viewmodel.formKey.currentState.validate()) {
                                  bool isValid =
                                      await viewmodel.checkCredential();
                                  if (isValid) {
                                    Navigator.popAndPushNamed(context, '/');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Invalid Credential, please try again')));
                                  }
                                }
                              }),
                        )),
                  ],
                )),
            Expanded(flex: 3, child: Container()),
          ],
        ),
      ),
    );
  }
}
