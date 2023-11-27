import 'package:flutter/material.dart';
import 'package:cgpa_calculator/home_view.dart';
import 'package:cgpa_calculator/login_view.dart';

class CgpaCalculator extends StatelessWidget {
  const CgpaCalculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CGPA CALCULATOR ",
      initialRoute: "/home",
      routes: {
        "/" :(context) => LoginPage(),
        "/login" :(context) => LoginPage(),
        "/home" :(context) => HomeView()
      },
    );
  }
}




