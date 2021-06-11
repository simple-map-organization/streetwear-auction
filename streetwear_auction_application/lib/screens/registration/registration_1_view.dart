import 'package:flutter/material.dart';
import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/screens/registration/registration_viewmodel.dart';
import 'package:streetwear_auction_application/screens/view.dart';
import 'package:streetwear_auction_application/widgets/custom_authetication_button.dart';
import 'package:streetwear_auction_application/widgets/custom_text_field.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  static MaterialPageRoute createRoute(args) =>
      MaterialPageRoute(builder: (_) => RegistrationScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                if (viewmodel.isSent) {
                                  final String availableStatus =
                                      await viewmodel.checkUsername();
                                  if (availableStatus == "success") {
                                    viewmodel.setVariables();
                                    Navigator.pushNamed(
                                        context, '/registration_2');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(availableStatus)));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Please press \'SEND\' button for verification purpose.')));
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
    );
  }
}
