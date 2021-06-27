import 'package:flutter/material.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../widgets/custom_authetication_button.dart';
import '../view.dart';
import 'edit_profile_viewmodel.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/dropdown_list.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = '/editprofilescreen';
  static Route<dynamic> createRoute(args) => MaterialPageRoute(
      builder: (_) => EditProfileScreen(args == null ? null : args['arg']));

  final User user;
  EditProfileScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return ConsumerView(
      viewmodel: dependency<EditProfileViewModel>()..init(user),
      builder: (context, viewmodel, _) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context),
            ),
            shadowColor: Colors.transparent,
            title: Text('Edit Profile', style: TextStyle(fontSize: 16)),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(viewmodel.user.email),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Password',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      'change password',
                                      style: TextStyle(),
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'Phone num (+60)',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: CustomTextFormField(
                                    readOnly: false,
                                    maxLength: 10,
                                    isNumber: true,
                                    controller: viewmodel.phoneNumController),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              'My Bio',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: CustomTextFormField(
                                    readOnly: false,
                                    controller: viewmodel.bioController,
                                    maxLength: 500,
                                    isNumber: false,
                                    hintText: "Enter your bio here",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              'Delivery Address',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Column(
                            children: [
                              CustomTextFormField(
                                readOnly: false,
                                isNumber: false,
                                controller: viewmodel.address1Controller,
                                maxLength: 50,
                                hintText: "Address 1",
                              ),
                              CustomTextFormField(
                                readOnly: false,
                                isNumber: false,
                                controller: viewmodel.address2Controller,
                                maxLength: 50,
                                hintText: "Address 2",
                              ),
                              CustomTextFormField(
                                readOnly: false,
                                isNumber: false,
                                controller: viewmodel.address3Controller,
                                maxLength: 50,
                                hintText: "Address 3",
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: CustomTextFormField(
                                        readOnly: false,
                                        controller:
                                            viewmodel.postcodeController,
                                        maxLength: 5,
                                        isNumber: true,
                                        hintText: "Postcode",
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 4,
                                      child: DropDownList(
                                          viewmodel.user.state,
                                          viewmodel.dropdownStateOnChange,
                                          viewmodel.stateSelection)),
                                  Expanded(
                                    flex: 2,
                                    child: CustomTextFormField(
                                      controller: viewmodel.countryController,
                                      readOnly: true,
                                      isNumber: false,
                                      maxLength: 10,
                                      hintText: "Country",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              'Payment Method',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 16,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: CustomTextFormField(
                                    readOnly: false,
                                    isNumber: true,
                                    controller: viewmodel.cardController,
                                    maxLength: 16,
                                    hintText: "Card number",
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: DropDownList(
                                    viewmodel.expiryMonth,
                                    viewmodel.dropdownMonthOnChange,
                                    viewmodel.monthSelection),
                              ),
                              Expanded(
                                flex: 7,
                                child: DropDownList(
                                    viewmodel.expiryYear,
                                    viewmodel.dropdownYearOnChange,
                                    viewmodel.yearSelection),
                              ),
                              Expanded(
                                flex: 6,
                                child: CustomTextFormField(
                                  readOnly: false,
                                  isNumber: true,
                                  controller: viewmodel.cvvController,
                                  maxLength: 3,
                                  hintText: "CVV",
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Facebook link',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: CustomTextFormField(
                                      readOnly: false,
                                      isNumber: false,
                                      controller: viewmodel.fbLinkController,
                                      maxLength: 50,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Instagram link',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: CustomTextFormField(
                                      readOnly: false,
                                      isNumber: false,
                                      controller: viewmodel.igLinkController,
                                      maxLength: 50,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Legit Check Link',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: CustomTextFormField(
                                      readOnly: false,
                                      isNumber: false,
                                      controller: viewmodel.lcLinkController,
                                      maxLength: 50,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CustomAuthenticationButton(
                    text: 'Update',
                    onPressed: () {
                      viewmodel.updateUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Update success!')));
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
