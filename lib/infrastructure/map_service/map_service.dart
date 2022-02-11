import 'package:cloud_firestore/cloud_firestore.dart';

class MapService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<dynamic> getMarkers() async {
    final response = await firestore
        .collection('bicycles')
        .doc("points")
        .get()
        .then((value) => value.data());
    return response;
  }
}
