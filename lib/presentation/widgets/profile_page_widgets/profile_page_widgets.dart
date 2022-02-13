import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/colorized_card.dart';

Widget ProfilePageAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          icon: Icon(Icons.exit_to_app,color: Colors.white60,),
          onPressed: () {
            showMyDialog(context);
          }),
    ],
  );
}
 Column buildRidesHistory() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sürüş Geçmişi',
            style: TextStyle(fontSize: 19, color: Colors.white60),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.directions_bike_rounded),
                    title: Text('asdasd'),
                  ));
            }),
      ],
    );
  }

  Column buildCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ColorizedCard(
                color: Colors.yellow.shade700,
                topText: 'Toplam Sürüş',
                bottomText: 'test',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ColorizedCard(
                color: Colors.red,
                topText: 'Yapılan Mesafe',
                bottomText: 'test',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: ColorizedCard(
                color: Colors.green,
                topText: 'Credits',
                bottomText: 'test',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ColorizedCard(
                color: Colors.blue,
                topText: 'Kalori',
                bottomText: 'test',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ColorizedCard(
                color: Colors.purple,
                topText: 'Seviye',
                bottomText: 'Gümüş',
              ),
            ),
          ],
        ),
      ],
    );
  }

Future<dynamic> showMyDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Do you really want to quit?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  context.read<LoginCubit>().signOut();
                },
                child: Text('Yes')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
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
      radius: 40,
      backgroundColor: Colors.black,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 64,
            height: 64,
          ),
        ),
      ),
    );
  }
}

