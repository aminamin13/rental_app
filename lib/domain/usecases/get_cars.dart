import 'package:rental_app/data/models/car_model.dart';
import 'package:rental_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<CarModel>> call() async {
    return await repository.fetchCars();
  }
}
