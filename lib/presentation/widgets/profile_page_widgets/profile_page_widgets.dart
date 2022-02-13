import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:teker_teker/application/login/login_cubit.dart';
import 'package:teker_teker/presentation/constants/constants.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/colorized_card.dart';

Widget ProfilePageAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white60,
          ),
          onPressed: () {
            showMyDialog(context);
          }),
    ],
  );
}

Column buildRidesHistory(state) {
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
          itemCount: state.profileInformation['totalridecount'],
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
                  title: Text('13.02.2022'),
                ));
          }),
    ],
  );
}

Column buildCards(state) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: ColorizedCard(
              color: Colors.yellow.shade700,
              topText: 'Toplam Sürüş Süresi (dk)',
              bottomText:
                  state.profileInformation['total_driving_time'].toString(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ColorizedCard(
              color: Colors.red,
              topText: 'Yapılan Mesafe (km)',
              bottomText:
                  state.profileInformation['travalled_distance'].toString(),
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
              bottomText: state.profileInformation['credit'].toString(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ColorizedCard(
              color: Colors.blue,
              topText: 'Kalori',
              bottomText: state.profileInformation['calorie'].toString(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: ColorizedCard(
              color: Colors.purple,
              topText: 'Seviye',
              bottomText: state.profileInformation['driver_type'],
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
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
          backgroundColor: kBodyColor,
          title: Text('Çıkmak İstediğine Emin misin ?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                  context.read<LoginCubit>().signOut();
                },
                child: Text(
                  'Evet',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Hayır',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
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
