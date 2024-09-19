import 'package:flutter/material.dart';
import 'package:mvvm_project/utlis/routes/AppRoutes.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/views/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.loginScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

