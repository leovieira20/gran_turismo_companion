import 'package:flutter/material.dart';
import 'package:gran_turismo/ioc.dart';
import 'package:gran_turismo/pages/car_list/car_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: ioc<CarListPage>(),
    );
  }
}