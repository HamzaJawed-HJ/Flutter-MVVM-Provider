import 'package:flutter/material.dart';
import 'package:mvvm_project/utlis/routes/AppRoutes.dart';
import 'package:mvvm_project/utlis/routes/routesName.dart';
import 'package:mvvm_project/viewModel/auth_view_model.dart';
import 'package:mvvm_project/viewModel/home_view_model.dart';
import 'package:mvvm_project/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
