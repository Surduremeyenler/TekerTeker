import 'package:flutter/material.dart';

class CreditsPageAppBar extends StatelessWidget {
  const CreditsPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Teker Teker',
      ),
      backgroundColor: Colors.blueAccent[600],
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) => Row(
          children: [
            IconButton(
              icon: const Icon(Icons.dehaze_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ],
        ),
      ),
      elevation: 0,
      titleSpacing: 0,
    );
  }
}
