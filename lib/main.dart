import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'helpers/lulz_imports.dart';

void main() async {
  await GetStorage.init();

  runApp(const Rawr());
}
