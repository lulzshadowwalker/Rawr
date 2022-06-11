part of './helpers/lulz_imports.dart';

class Rawr extends StatelessWidget {
  const Rawr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rawr',
      home:  const LulzViewport(),
      debugShowCheckedModeBanner: false,
      theme: LulzTheme.light,
      darkTheme: LulzTheme.dark,
    );
  }
}
