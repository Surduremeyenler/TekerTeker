import 'package:flutter/material.dart';

class ContractedShop extends StatelessWidget {
  const ContractedShop({
    Key? key,
    required this.text,
    required this.image,
    this.press,
  }) : super(key: key);

  final String text;
  final Image image;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: image),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(text, style: TextStyle(color: Colors.black)),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
