import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import '../blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Text("My Home"),
            centerTitle: true,
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
