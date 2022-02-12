import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/constants/constants.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_item_list.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_user_card.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Item(
            image: Image.asset('assets/hepsiburada-logo-1024.png'),
            text: 'Hepsiburada',
            press: () => {},
          ),
          Item(
            image: Image.asset('assets/Kartal_Yuvası_Logosu.png'),
            text: 'Kartal Yuvası',
            press: () {},
          ),
          Item(
            image: Image.asset('assets/migrros.png'),
            text: 'Migros Sanal Market',
            press: () {},
          ),
          Item(
            image: Image.asset('assets/trendyol-logo.png'),
            text: 'Trendyol',
            press: () {},
          ),
          Item(
            image: Image.asset('assets/migrros.png'),
            text: 'Migros Hediye Çeki',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CreditPageTopSection extends StatelessWidget {
  const CreditPageTopSection(
      {Key? key, required this.firebaseFirestore})
      : super(key: key);
  final firebaseFirestore;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-4.0, 0.0),
            end: Alignment(0.0, 1.5),
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
              kGradientColor1,
              kGradientColor2,
              kGradientColor3,
              kGradientColor4,
              kGradientColor4
            ],
            stops: [0.0, 0.3, 0.2, 0.3, 0.63, 0.63, 0.0],
          ),
        ),
        child: CreditPageUserCard());
  }
}

class CreditPageBottomSection extends StatelessWidget {
  const CreditPageBottomSection(
      {Key? key, required this.firebaseFirestore})
      : super(key: key);
  final firebaseFirestore;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3.5),
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: kBodyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              '6,700 TKL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: 20.0),
            ButtonTheme(
              height: MediaQuery.of(context).size.height / 8,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(
                      MediaQuery.of(context).size.width / 1.5,
                      MediaQuery.of(context).size.height / 10,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade900),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )),
                child: Text(
                  'Earn Teker Teker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
