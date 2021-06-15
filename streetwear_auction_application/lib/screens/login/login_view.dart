import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/login/login_viewmodel.dart';
import 'package:streetwear_auction_application/screens/registration/registration_1_view.dart';
import 'package:streetwear_auction_application/screens/view.dart';
import 'package:streetwear_auction_application/widgets/custom_authetication_button.dart';
import 'package:streetwear_auction_application/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  static MaterialPageRoute createRoute() =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: ConsumerView(
        viewmodel: dependency<LoginViewModel>()..init(),
        builder: (context, viewmodel, _) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 15),
                  child: Container(
                    height: 200,
                    child: Image.asset(
                      'assets/img/logo-01.png',
                    ),
                  )),
              Text(
                'Login',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                height: 15,
              ),
              Form(
                  key: viewmodel.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 29, right: 29, bottom: 8),
                        child: CustomTextField(
                            hintText: 'username/email',
                            obscured: false,
                            controller: viewmodel.usernameController),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 29, right: 29, bottom: 8),
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
                              Navigator.pushNamed(
                                  context, RegistrationScreen.routeName);
                            },
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomAuthenticationButton(
                                text: 'Login',
                                onPressed: () async {
                                  if (!viewmodel.formKey.currentState
                                      .validate()) return;

                                  if (!await viewmodel.checkCredential())
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Invalid Credential, please try again')));
                                }),
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
