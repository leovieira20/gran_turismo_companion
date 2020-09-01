import 'dart:collection';
import 'package:gran_turismo/models/car.dart';

extension CarListExtensions on List<Car> {
  List<T> extractValues<T>(T Function(Car) selector) {
    var map = this.map(selector);
    var linkedHash = LinkedHashSet<T>.from(map);
    return linkedHash.toList(growable: false);
  }
}
