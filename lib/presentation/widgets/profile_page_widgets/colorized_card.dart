import 'package:flutter/material.dart';

class ColorizedCard extends StatelessWidget {
  const ColorizedCard({
    Key? key,
    required this.color,
    required this.topText,
    required this.bottomText,
  }) : super(key: key);
  final Color color;
  final String topText;
  final String bottomText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topText,
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
          Divider(
            color: Colors.grey[800],
            indent: 20,
            endIndent: 20,
          ),
          Text(
            bottomText,
            style: TextStyle(fontSize: 19, color: Colors.white),
          ),
        ],
      ),
    );
  }
}