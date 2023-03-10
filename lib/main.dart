import 'package:flutter/cupertino.dart';
import 'package:learn_api_in_flutter/translate_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: TranslateScreen(),
    );
  }
}

