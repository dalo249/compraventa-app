import 'package:flutter_application_2/models/compraventa.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final CompraVenta compraventa;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;


  const ItemCard({
    super.key,
    required this.compraventa,
    required this.onTap,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 12.0),
        child: InkWell(
          onTap: onTap,
          child:  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(compraventa.title),
              const SizedBox(height: 4.0,),
              Text(compraventa.category),
              const SizedBox(height: 4.0,),
              Text(compraventa.description),
            ],
          ), 
        ),
        ),
      );
    
    }

}