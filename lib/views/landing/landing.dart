import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rawr/helpers/lulz_imports.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    super.initState();

    GetStorage storage = GetStorage();
    storage.write(LulzConst.isFirstLaunch, false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Landing')));
  }
}
