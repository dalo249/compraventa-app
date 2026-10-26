import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_2/core/config/app_config.dart';
import 'package:flutter_application_2/domain/models/compraventa.dart';
import 'package:http/http.dart' as http;

class CompraventaService {

  final Duration timeout;
  final http.Client _client;
  final String _apiBaseUrl = AppConfig.apiBaseUrl;

  CompraventaService( {
    required this._client,
    this.timeout = const Duration(seconds: 15)
  });


  Future<List<CompraVenta>> getCompraventas() async {

    //request
    final uri = Uri.parse('$_apiBaseUrl/compraventas');

    late final http.Response response;

    try {
      response = await _client.get(uri)
      .timeout(timeout);

    } on TimeoutException catch(error) {
      throw Exception('Peticion supero tiempo limite, $error');

    } on http.ClientException catch(error) {
      throw Exception('error de conexion: $error');
    }

    if(response.statusCode != 200){
      throw Exception('ocurrio error peticion http, codigo: ${response.statusCode}');
    }

    //TODO: manejar excepciones http segun statusCode

    //validacion del json, fromato response correcto

    //como response.body es solo texto plano validar -> decodificar json a Map valido 
    late final dynamic data;
    try {
      data = jsonDecode(response.body);
    } on FormatException catch(error) {
      throw Exception("Error de formato: $error");
    }

    //Validar json decodificado sea una lista
    if(data is! List){
      throw Exception("Formato de response invalido, no lista de compraventas");
    }
    
    //validar instancia compraventa: campos requeridos, tipo
    try {
      return data.map((item) => CompraVenta.fromJson(item)).toList();
    } on Object catch(error) {
      throw Exception("Error creando una instancia compraventa: $error");
    }
    

  }

}