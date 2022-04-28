part of '../../helpers/lulz_imports.dart';

class DHome extends StatelessWidget {
  const DHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: Get.find<AuthenticationController>().signUpWithEmailAndPassword,
              child: const Icon(Icons.add))),
    );
  }
}
