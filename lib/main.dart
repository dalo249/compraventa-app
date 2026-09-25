import 'package:flutter/material.dart';
import 'package:flutter_application_2/router/app_router.dart';
import 'package:flutter_application_2/router/app_routes.dart';
import 'presentation/screens/compraventa_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.compraventa,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
