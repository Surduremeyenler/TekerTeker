import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(202, 9, 20, 1),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://i4.hurimg.com/i/hurriyet/75/866x494/6134d3f74e3fe118486a0c5b.jpg')),
            ),
            child: Container(),
          ),
          ListTile(
              leading: const Icon(Icons.directions_bus),
              title: Text(
                'Bize Ulaşın',
              ),
              onTap: () {}),
          ListTile(
              leading: const Icon(
                Icons.lunch_dining,
              ),
              title: Text(
                'Hakkımızda',
              ),
              onTap: () {}),
        ],
      ),
    );
  }
}
