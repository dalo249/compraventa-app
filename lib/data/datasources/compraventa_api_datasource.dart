import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_2/config/app_config.dart';
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

    //decodificar json
    final List<dynamic> data = jsonDecode(response.body);

    //transformar json
    return data.map((item) => CompraVenta.fromJson(item)).toList();

  }

}