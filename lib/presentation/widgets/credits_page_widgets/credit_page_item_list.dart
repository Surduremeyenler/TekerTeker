import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.text,
    required this.imagem,
    this.press,
  }) : super(key: key);

  final String text;
  final Image imagem;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            //   Icon(Icons.date_range, color: Colors.black),
            Container(
              child: CircleAvatar(
                  child: imagem, backgroundColor: Colors.transparent),
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
