import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/home_page_router/home_page_router_cubit.dart';
import 'package:teker_teker/domain/credit_page_contracted_shop_list/credit_page_contracted_shop_list.dart';
import 'package:teker_teker/presentation/constants/constants.dart';
import 'package:teker_teker/presentation/widgets/credits_page_widgets/credit_page_user_card.dart';

class CreditPageTopSection extends StatelessWidget {
  const CreditPageTopSection({Key? key, required this.firebaseFirestore})
      : super(key: key);
  final firebaseFirestore;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
      child: CreditPageUserCard(firebaseFirestore: firebaseFirestore),
    );
  }
}

class CreditPageBottomSection extends StatelessWidget {
  const CreditPageBottomSection({Key? key, required this.firebaseFirestore})
      : super(key: key);
  final firebaseFirestore;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: size.height / 3.5,
        ),
        padding: EdgeInsets.only(top: 15.0),
        decoration: BoxDecoration(
          color: kBodyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cüzdan',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              firebaseFirestore['teker_lira'].toString() + ' TKL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: 20.0),
            ButtonTheme(
              height: size.height / 8,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<HomePageRouterCubit>()
                      .changeThePage(newPageIndex: 1);
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(
                      size.width / 1.5,
                      size.height / 10,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red.shade900),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    )),
                child: Text(
                  'Teker Teker Lirası Kazan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ContractedShopList(),
          ],
        ),
      ),
    );
  }
}
