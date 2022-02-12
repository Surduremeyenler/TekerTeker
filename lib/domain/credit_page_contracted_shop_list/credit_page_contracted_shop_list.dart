import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_item_list.dart';

class ContractedShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ContractedShop(
            image: Image.asset('assets/hepsiburada-logo-1024.png'),
            text: 'Hepsiburada',
            press: () => {},
          ),
          ContractedShop(
            image: Image.asset('assets/Kartal_Yuvası_Logosu.png'),
            text: 'Kartal Yuvası',
            press: () {},
          ),
          ContractedShop(
            image: Image.asset('assets/migrros.png'),
            text: 'Migros Sanal Market',
            press: () {},
          ),
          ContractedShop(
            image: Image.asset('assets/trendyol-logo.png'),
            text: 'Trendyol',
            press: () {},
          ),
          ContractedShop(
            image: Image.asset('assets/migrros.png'),
            text: 'Migros Hediye Çeki',
            press: () {},
          ),
        ],
      ),
    );
  }
}
