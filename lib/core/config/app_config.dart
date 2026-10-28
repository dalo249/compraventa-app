import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {

  AppConfig._();

 //valida url exista, tenga estructura valida
  static String get apiBaseUrl {

    final String value = dotenv.get('API_BASE_URL').trim();
    final uri = Uri.tryParse(value);

    if( uri == null || 
        !uri.hasScheme ||
        uri.host.isEmpty ||
        !{'http', 'https'}.contains(uri.scheme)
    ){
      throw StateError('API_BASE_URL debe ser una url http invalida');
    }

    return (value.endsWith('/') 
            ? value.substring(0, value.length - 1)
            : value );

  }
}