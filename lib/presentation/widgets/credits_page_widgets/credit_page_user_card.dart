import 'package:flutter/material.dart';
import 'package:teker_teker/presentation/constants/constants.dart';

class CreditPageUserCard extends StatelessWidget {
  final firebaseFirestore;

  const CreditPageUserCard({Key? key, this.firebaseFirestore})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 9,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: kCardName,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(firebaseFirestore['photoURL']),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              firebaseFirestore['displayName'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              firebaseFirestore['driver_type'],
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
                    SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
