import 'package:flutter/material.dart';
import 'package:gran_turismo/ioc.dart';
import 'package:gran_turismo/my_app.dart';

void main() {
  setupIoc();
  runApp(ioc<MyApp>());
}