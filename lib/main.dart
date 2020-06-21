import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppu/models/cart.dart';
// import 'package:shoppu/screens/home.dart';
import 'package:shoppu/screens/splash.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Cart(),
        child: App(),
      ),
    );

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
