import 'package:rental_app/data/models/car_model.dart';

abstract class CarRepository {
  Future<List<CarModel>> fetchCars();
  
}