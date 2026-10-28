

import 'package:flutter_application_2/domain/models/compraventa.dart';

abstract class CompraventaRepository {

  Future <List<CompraVenta>> getCompraventas();
  
}