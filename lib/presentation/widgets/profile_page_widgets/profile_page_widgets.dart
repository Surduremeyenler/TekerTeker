import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:teker_teker/application/login/login_cubit.dart';

Widget ProfilePageAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            showMyDialog(context);
          }),
    ],
  );
}

Future<dynamic> showMyDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Do you really want to quit?'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  context.read<LoginCubit>().signOut();
                },
                child: Text('Yes')),
            TextButton(
              onPressed: () {
                Navigator.pop(context); //close Dialog
              },
              child: Text('Close'),
            )
          ],
        );
      });
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BuildImage(),
    );
  }

  Widget BuildImage() {
    final image = NetworkImage(imagePath);

    return CircleAvatar(
      radius: 70,
      backgroundColor: Colors.purple,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 128,
            height: 128,
          ),
        ),
      ),
    );
  }
}

Widget BuildName(String displayName, String email) => Column(
      children: [
        Text(
          displayName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          email,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
