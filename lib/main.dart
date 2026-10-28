import 'package:flutter/material.dart';

import 'package:flutter_application_2/data/datasources/compraventa_api_datasource.dart';
import 'package:flutter_application_2/core/router/app_router.dart';
import 'package:flutter_application_2/core/router/app_routes.dart';
import 'package:flutter_application_2/data/repositories/api_compraventa_repository.dart';
import 'package:flutter_application_2/domain/repositories/compraventa_repository.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


Future<void> main() async {
  await dotenv.load(fileName: '.env');

  //Inyeccion dependencias temporal
  final client = http.Client();
  final compraventaService = CompraventaApiService(client: client);
  final compraventaRepository = ApiCompraventaRepository(compraventaService: compraventaService);

  runApp( MyApp(compraventaRepository: compraventaRepository,));
}

//no deberia tener constructor, por inyeccion temporal
class MyApp extends StatelessWidget {

  final CompraventaRepository compraventaRepository;

  const MyApp({
    super.key,
    required this.compraventaRepository,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.compraventa,
      onGenerateRoute: AppRouter(compraventaRepository: compraventaRepository).onGenerateRoute,
    );
  }
}


Future<void> probarServicio() async {
  final http.Client client = http.Client();

  try {
    final service = CompraventaApiService(client: client);
    final compraventas = await service.getCompraventas();

    debugPrint('Se recibieron ${compraventas.length} registros');

    for (final item in compraventas) {
      debugPrint('${item.id}: ${item.title} - ${item.price}');
    }
    
   } catch (error, stackTrace) {
    debugPrint('Falló la prueba del servicio: $error');
    debugPrint('$stackTrace');
  } finally {
    client.close();
  }
}
