import 'package:flutter/material.dart';

Widget CreditNumbersWidget(context, {turkishLira, credit}) {
  return BuildButton(context, turkishLira: turkishLira, credit: credit);
}

Widget BuildButton(BuildContext context, {int? credit, int? turkishLira}) =>
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Turkish Lira: ' + turkishLira.toString() + '₺',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          'Credit: ' + credit.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
