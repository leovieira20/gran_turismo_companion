import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gran_turismo/models/car.dart';

class CarFileRepository {
  Future<List<Car>> get() async {
    var json = await rootBundle.loadString("assets/car_list.json");

    var jsonList = jsonDecode(json) as List<dynamic>;
    assert(jsonList != null);

    var cars = jsonList.map((e) => Car.fromJson(e)).toList(growable: false);

    assert(cars.length == jsonList.length);

    return cars;
  }
}