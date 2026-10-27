import 'package:flutter_application_2/data/datasources/compraventa_api_datasource.dart';
import 'package:flutter_application_2/domain/models/compraventa.dart';
import 'package:flutter_application_2/domain/repositories/compraventa_repository.dart';

class ApiCompraventaRepository implements CompraventaRepository{

  final CompraventaApiService _compraventaService;

  const ApiCompraventaRepository({
    required CompraventaApiService compraventaService
  }): _compraventaService = compraventaService;

  @override
  Future<List<CompraVenta>> getCompraventas() async {
    
    final List<CompraVenta> compraventas = await _compraventaService.getCompraventas();
    return compraventas;
  }

}