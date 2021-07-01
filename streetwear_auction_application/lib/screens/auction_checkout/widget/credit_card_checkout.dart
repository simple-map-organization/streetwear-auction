import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardCheckout extends StatefulWidget {
  CreditCardCheckout();

  @override
  _CreditCardCheckoutState createState() => _CreditCardCheckoutState();
}

class _CreditCardCheckoutState extends State<CreditCardCheckout> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        CreditCardForm(
          formKey: formKey,
          cardNumber: cardNumber,
          cvvCode: cvvCode,
          cardHolderName: cardHolderName,
          expiryDate: expiryDate,
          themeColor: Colors.blue,
          cardNumberDecoration: InputDecoration(
            labelText: 'Number',
            hintText: 'XXXX XXXX XXXX XXXX',
            labelStyle: TextStyle(fontSize: 12.0),
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(10.0),
            isCollapsed: true,
          ),
          expiryDateDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expired Date',
            hintText: 'XX/XX',
            labelStyle: TextStyle(fontSize: 12.0),
            contentPadding: EdgeInsets.all(10.0),
            isCollapsed: true,
          ),
          cvvCodeDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'CVV',
            hintText: 'XXX',
            labelStyle: TextStyle(fontSize: 12.0),
            contentPadding: EdgeInsets.all(10.0),
            isCollapsed: true,
          ),
          cardHolderDecoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Card Holder',
            labelStyle: TextStyle(fontSize: 12.0),
            contentPadding: EdgeInsets.all(10.0),
            isCollapsed: true,
          ),
          onCreditCardModelChange: onCreditCardModelChange,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            primary: const Color(0xff1b447b),
          ),
          child: Container(
            margin: const EdgeInsets.all(8),
            child: const Text(
              'Validate',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'halter',
                fontSize: 14,
                package: 'flutter_credit_card',
              ),
            ),
          ),
          onPressed: () {
            if (formKey.currentState.validate()) {
              Navigator.of(context).pop(true);
            } else {
              print('invalid!');
            }
          },
        )
      ],
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
