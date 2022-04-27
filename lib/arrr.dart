part of './helpers/lulz_imports.dart';

class Arrr extends StatelessWidget {
  const Arrr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrr',
      home: const MHome(),
      debugShowCheckedModeBanner: false,
      theme: LulzTheme.light,
      darkTheme: LulzTheme.dark,
    );
  }
}
