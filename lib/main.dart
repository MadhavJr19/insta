import 'package:flutter/material.dart';

import 'pages/login.dart';

void main() {
  runApp(const insta());
}

class insta extends StatelessWidget {
  const insta({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
