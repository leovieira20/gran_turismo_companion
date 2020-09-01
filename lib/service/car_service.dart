import 'package:gran_turismo/models/car.dart';
import 'package:gran_turismo/repositories/car_file_repository.dart';
import 'package:supercharged/supercharged.dart';

class CarService {
  final CarFileRepository _carFileRepository;

  List<Car> _cars;

  CarService(this._carFileRepository);

  Future<List<Car>> get() async {
    try {
      if (_cars != null) {
        return _cars;
      }

      var cars = await _carFileRepository.get();

      _cars = cars.sortedByString((c) => c.category).sortedByNum((c) => c.power);

      return _cars.toList(growable: false);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
