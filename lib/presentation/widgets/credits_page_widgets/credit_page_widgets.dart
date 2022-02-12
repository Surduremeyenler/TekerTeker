import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/constants/constants.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_item_list.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: kCardName,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/212cee95875ce62c2b290d4d18c1f815.jpg'),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Azad Yıldız',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Gümüş Sürücü',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.yellow.shade800,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 8),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 37,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Item(
            imagem: Image.asset('assets/hepsiburada-logo-1024.png'),
            text: 'Hepsiburada.com',
            press: () => {},
          ),
          Item(
            imagem: Image.asset('assets/Kartal_Yuvası_Logosu.png'),
            text: 'Kartal Yuvası',
            press: () {},
          ),
          Item(
            imagem: Image.asset('assets/migrros.png'),
            text: 'Migros Sanal Market',
            press: () {},
          ),
          Item(
            imagem: Image.asset('assets/trendyol-logo.png'),
            text: 'Trendyol',
            press: () {},
          ),
          Item(
            imagem: Image.asset('assets/hepsiburada-logo-1024.png'),
            text: 'Hepsiburada.com',
            press: () {},
          ),
          Item(
            imagem: Image.asset('assets/migrros.png'),
            text: 'Migros Hediye Çeki',
            press: () {},
          ),
        ],
      ),
    );
  }
}
