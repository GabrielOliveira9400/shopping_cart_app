import 'package:flutter/material.dart';

import 'blocs/home.bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  HomePage({super.key});
  
  var bloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Shopping Cart'),
      ),
    );
  }
}
