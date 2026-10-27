
import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/models/compraventa.dart';
import 'package:flutter_application_2/domain/repositories/compraventa_repository.dart';
import 'package:flutter_application_2/presentation/screens/compraventa_detail.dart';
import 'package:flutter_application_2/presentation/screens/compraventa_screen.dart';
import 'package:flutter_application_2/core/router/app_routes.dart';

//Debe ser clase estatica, se quita para inyeccion dependecias temporal
class AppRouter{

  //TODO: Inyeccion de dependencias temporal, router no atributos
  final CompraventaRepository compraventaRepository;

  const AppRouter({
    required this.compraventaRepository,
  });

  Route<dynamic> onGenerateRoute(RouteSettings settings ){

    switch (settings.name){

      case AppRoutes.compraventa: 
        return MaterialPageRoute( 
          builder: (context) => CompraventaScreen(compraventaRepository: compraventaRepository,),
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
          builder: (context) => CompraventaScreen(compraventaRepository: compraventaRepository),
          settings: settings
        );
           
    }
  } 
}