import 'package:cloud_firestore/cloud_firestore.dart';

class MapService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<dynamic> getMarkers() async {
    return await firestore
        .collection('bicycles')
        .doc("points")
        .get()
        .then((value) => print(value.data()!["markers"][0]["geopoint"]));
  }
}
