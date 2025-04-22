import 'package:rental_app/data/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<CarModel>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((e) => CarModel.fromMap(e.data())).toList();
  }
}
