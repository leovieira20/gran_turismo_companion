// import 'dart:io';
// // import 'package:gran_turismo/repositories/car_file_repository.dart';
// // import 'package:moor/ffi.dart';
// // import 'package:moor/moor.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:path/path.dart' as p;
//
// // class Cars extends Table {
// //   IntColumn get id => integer().autoIncrement()();
// //
// //   TextColumn get name => text()();
// //
// //   TextColumn get imageSrc => text()();
//
//   TextColumn get category => text()();
//
//   TextColumn get drive => text()();
//
//   IntColumn get power => integer()();
//
//   TextColumn get weight => text()();
//
//   TextColumn get speed => text()();
//
//   TextColumn get acceleration => text()();
//
//   TextColumn get cornering => text()();
//
//   TextColumn get braking => text()();
//
//   TextColumn get stability => text()();
//
//   TextColumn get global => text()();
//
//   TextColumn get credit => text()();
// }
//
// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return VmDatabase(file);
//   });
// }

// class Database extends _$Database {
//   final CarFileRepository _fileRepository;
//
//   Database(this._fileRepository) : super(_openConnection());
//
//   Future<List<Car>> getAllCars() async {
//     return await select(_cars).get();
//   }
//
//   @override
//   int get schemaVersion => 1;
//
//   @override
//   MigrationStrategy get migration => MigrationStrategy(
//         onCreate: (Migrator m) {
//           return m.createAll();
//         },
//         beforeOpen: (details) async {
//           if (!details.wasCreated) return;
//
//           var cars = await _fileRepository.getCarsFromFile();
//
//           for (var c in cars) {
//             into(_cars).insert(
//               CarsCompanion(
//                 name: Value(c.name),
//                 imageSrc: Value(c.imageSrc),
//                 category: Value(c.category),
//                 drive: Value(c.drive),
//                 power: Value(c.power),
//                 weight: Value(c.weight),
//                 speed: Value(c.speed),
//                 acceleration: Value(c.acceleration),
//                 cornering: Value(c.cornering),
//                 braking: Value(c.braking),
//                 stability: Value(c.stability),
//                 global: Value(c.global),
//                 credit: Value(c.credit),
//               ),
//             );
//           }
//         },
//       );
// }
