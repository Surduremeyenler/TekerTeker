import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teker_teker/application/cubit/profile_cubit.dart';
import 'package:teker_teker/application/cubit/profile_cubit.dart';
import 'package:teker_teker/application/cubit/profile_state.dart';
import 'package:teker_teker/presentation/widgets/loading_indicator.dart';
import 'package:teker_teker/presentation/widgets/profile_page_widgets/profile_page_widgets.dart';

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Center(
          child: LoadingIndicator(),
        );
      } else {
        state as ProfileLoaded;
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ProfileWidget(
                  imagePath: state.profileInformation['photoURL'],
                  onClicked: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.profileInformation['displayName'],
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ColorizedCard(
                        color: Colors.yellow.shade700,
                        topText: 'test',
                        bottomText: 'test',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ColorizedCard(
                        color: Colors.red,
                        topText: 'test',
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
                        topText: 'test',
                        bottomText: 'test',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ColorizedCard(
                        color: Colors.blue,
                        topText: 'test',
                        bottomText: 'test',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ColorizedCard(
                        color: Colors.purple,
                        topText: 'test',
                        bottomText: 'test',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
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
            ),
          ),
        );
      }
    });
  }
}

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
