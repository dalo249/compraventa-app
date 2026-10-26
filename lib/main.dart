import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/datasources/compraventa_api_datasource.dart';
import 'package:flutter_application_2/core/router/app_router.dart';
import 'package:flutter_application_2/core/router/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


Future<void> main() async {
  await dotenv.load(fileName: '.env');

  await probarServicio();

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


Future<void> probarServicio() async {
  final http.Client client = http.Client();

  try {
    final service = CompraventaService(client: client);
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
