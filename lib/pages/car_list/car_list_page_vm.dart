import 'dart:async';
import 'package:gran_turismo/models/car.dart';
import 'package:gran_turismo/models/dropdown_model.dart';
import 'package:gran_turismo/service/car_service.dart';
import 'package:supercharged/supercharged.dart';
import 'package:rxdart/rxdart.dart';
import 'package:gran_turismo/extensions/car_list_extensions.dart';

class CarListPageVm {
  var _carsController = StreamController<List<Car>>.broadcast();
  var _isSortingAscendingSubject = BehaviorSubject<bool>();
  var _categoryFilter = BehaviorSubject<DropdownModel<String>>();
  var _driveFilter = BehaviorSubject<DropdownModel<String>>();

  List<String> _categories;
  List<String> _drives;

  bool _isSortingAscending = true;
  String _selectedCategory;
  String _selectedDrive;

  final CarService carListService;

  CarListPageVm(this.carListService);

  void get() async {
    var cars = await carListService.get();

    _carsController.add(cars);
    _categoryFilter.add(_makeCategoryFilter(cars));
    _driveFilter.add(_makeDriverFilter(cars));
  }

  void filterByCategory(String value) async {
    _selectedCategory = value;
    _categoryFilter.add(_makeCategoryFilter(await carListService.get(), selectedValue: value));
    _filter();
  }

  void filterByDrive(String value) async {
    _selectedDrive = value;
    _driveFilter.add(_makeDriverFilter(await carListService.get(), selectedValue: value));
    _filter();
  }

  Future<void> clearFilters() async {
    _selectedCategory = null;
    _selectedDrive = null;

    _categoryFilter.add(_makeCategoryFilter(await carListService.get()));
    _driveFilter.add(_makeDriverFilter(await carListService.get()));

    _filter();
  }

  void toggleSort() {
    _isSortingAscending = !_isSortingAscending;
    _isSortingAscendingSubject.add(_isSortingAscending);
    _filter();
  }

  void dispose() {
    _carsController.close();
    _isSortingAscendingSubject.close();
    _categoryFilter.close();
    _driveFilter.close();
  }

  DropdownModel<String> _makeCategoryFilter(List<Car> cars, {String selectedValue}) {
    _categories = cars.extractValues((c) => c.category).sortedByString((s) => s);
    return DropdownModel<String>(_categories, selectedValue);
  }

  DropdownModel<String> _makeDriverFilter(List<Car> cars, {String selectedValue}) {
    _drives = cars.extractValues((c) => c.drive).sortedByString((s) => s);
    return DropdownModel<String>(_drives, selectedValue);
  }

  Future<void> _filter() async {
    var allCars = await carListService.get();
    var filtered = allCars;

    if (_selectedCategory != null) {
      filtered = filtered.filter((c) => c.category == _selectedCategory).toList();
    }

    if (_selectedDrive != null) {
      filtered = filtered.filter((c) => c.drive == _selectedDrive).toList();
    }

    if (!_isSortingAscending) {
      filtered = filtered.sortedByNum((element) => element.power).reversed.toList();
    }

    _carsController.add(filtered);
  }

  Stream<List<Car>> get cars => _carsController.stream;
  Stream<bool> get isSortingAscending => _isSortingAscendingSubject;
  Stream<DropdownModel<String>> get categories => _categoryFilter;
  Stream<DropdownModel<String>> get drives => _driveFilter;
}
