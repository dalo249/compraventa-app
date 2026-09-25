

import 'package:flutter_application_2/compraventa.dart';
import 'package:flutter/material.dart';

class CompraventaDetail extends StatelessWidget {
  final CompraVenta compraventa;

  const CompraventaDetail({ super.key, required this.compraventa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(compraventa.title),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          }, 
          icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(compraventa.description),
        ),
    );
  }


}