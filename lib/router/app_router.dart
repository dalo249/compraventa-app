
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/compraventa.dart';
import 'package:flutter_application_2/presentation/screens/compraventa_detail.dart';
import 'package:flutter_application_2/presentation/screens/compraventa_screen.dart';
import 'package:flutter_application_2/router/app_routes.dart';

class AppRouter{

  static Route<dynamic> onGenerateRoute(RouteSettings settings ){

    switch (settings.name){

      case AppRoutes.compraventa: 
        return MaterialPageRoute( 
          builder: (context) => CompraventaScreen(),
          settings: settings
        );

      case AppRoutes.compraventaDetail:
        final compraventa = settings.arguments as CompraVenta;
        return MaterialPageRoute(
          builder: (context) =>  CompraventaDetail(compraventa: compraventa),
          settings: settings
        );

      default: 
        return MaterialPageRoute( 
          builder: (context) => CompraventaScreen(),
          settings: settings
        );
           
    }
  } 
}