import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rawr/helpers/lulz_imports.dart';

class DLanding extends StatefulWidget {
  const DLanding({Key? key}) : super(key: key);

  @override
  State<DLanding> createState() => _DLandingState();
}

class _DLandingState extends State<DLanding> {
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
