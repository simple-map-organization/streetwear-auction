import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../widgets/custom_authetication_button.dart';
import '../../widgets/custom_text_field.dart';
import '../view.dart';
import 'registration_viewmodel.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => RegistrationScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: SingleChildScrollView(
        child: Stack(children: [
          ConsumerView(
            viewmodel: dependency<RegistrationViewModel>()..init(),
            builder: (context, viewmodel, _) => SingleChildScrollView(
              child: Form(
                key: viewmodel.formKey,
                child: Column(
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
                      padding: const EdgeInsets.only(
                          left: 29, right: 29, top: 15, bottom: 5),
                      child: Container(
                        height: 60,
                        child: CustomTextField(
                          hintText: 'username',
                          obscured: false,
                          controller: viewmodel.usernameController,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 29, right: 29, bottom: 5),
                      child: Container(
                        height: 60,
                        child: CustomTextField(
                          hintText: 'password',
                          obscured: true,
                          controller: viewmodel.passwordController,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 29, right: 29, bottom: 5),
                      child: Container(
                        height: 60,
                        child: CustomTextField(
                          hintText: 'phone number',
                          obscured: false,
                          controller: viewmodel.phoneNoController,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 29, right: 29, bottom: 5),
                      child: Container(
                        height: 60,
                        child: CustomTextField(
                          hintText: 'email',
                          controller: viewmodel.emailController,
                          inputType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 29, right: 29, bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 60,
                              child: CustomTextField(
                                hintText: 'verification number',
                                enabled: viewmodel.isSent,
                                controller: viewmodel.verificationNoController,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: TextButton(
                                child: Text(
                                  viewmodel.isSent ? 'SENT' : 'SEND',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: viewmodel.isSent
                                          ? Colors.grey
                                          : Color.fromRGBO(118, 166, 208, 1)),
                                ),
                                onPressed: viewmodel.isSent
                                    ? null
                                    : () {
                                        if (viewmodel.formKey.currentState
                                            .validate()) {
                                          viewmodel.setIsSent();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'The verification code is sent to your phone via SMS.')));
                                        }
                                      },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomAuthenticationButton(
                        text: 'Next',
                        onPressed: viewmodel.isSent
                            ? () async {
                                if (viewmodel.formKey.currentState.validate()) {
                                  final String availableStatus =
                                      await viewmodel.checkUsername();
                                  if (availableStatus == "success") {
                                    viewmodel.setVariables();
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Navigator.pushNamed(
                                        context, '/registration_2');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(availableStatus)));
                                  }
                                }
                              }
                            : null),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
