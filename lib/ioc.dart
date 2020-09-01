import 'package:get_it/get_it.dart';
import 'package:gran_turismo/my_app.dart';
import 'package:gran_turismo/pages/car_list/car_list_page.dart';
import 'package:gran_turismo/pages/car_list/car_list_page_vm.dart';
import 'package:gran_turismo/repositories/car_file_repository.dart';
import 'package:gran_turismo/service/car_service.dart';

final ioc = GetIt.instance;

void setupIoc() {
  ioc.registerFactory(() => CarFileRepository());

  ioc.registerSingleton<CarService>(CarService(ioc<CarFileRepository>()));

  ioc.registerFactory(() => MyApp());

  ioc.registerFactory(() => CarListPageVm(ioc<CarService>()));
  ioc.registerFactory(() => CarListPage(ioc<CarListPageVm>()));
}
