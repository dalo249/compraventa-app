import 'dart:io';
import 'package:flutter_application_2/domain/repositories/compraventa_repository.dart';
import 'package:flutter_application_2/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/router/app_routes.dart';
import 'package:http/http.dart';
import '../../domain/models/compraventa.dart';

class CompraventaScreen extends StatefulWidget {

  final CompraventaRepository _compraventaRepository;

  const CompraventaScreen({
    super.key,
    required this._compraventaRepository,
    });

  @override
  State<CompraventaScreen> createState() => _CompraventaScreenState();
}

class _CompraventaScreenState extends State<CompraventaScreen> {
  // Estado de la pantalla.
  // Durante la clase analizaremos qué representa cada variable
  // y cuándo debe cambiar.
  bool isLoading = false;
  List<CompraVenta> compraVentas = [];
  String errorMessage = '';
  int? favoriteId;

  late Future<List<CompraVenta>> _futureCompraventas;

  void retryGetCompraventas() {
    setState(() {
      _futureCompraventas = widget._compraventaRepository.getCompraventas();
    });
  }

  void toggleFavorite(int compraventaId){
    setState(() {
      favoriteId = favoriteId == compraventaId ? null: compraventaId;
    });
  }

  @override
  void initState() {
    super.initState();

    //peticion getCompraventas
    _futureCompraventas = widget._compraventaRepository.getCompraventas();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compraventa'),
      ),
      body: _buildBody(),
    );
  }
  

  Widget _buildBody() {

    return FutureBuilder(
      future: _futureCompraventas,
      builder: (context, snapshot) {
        
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator()
          );
        }

        if(snapshot.hasError){
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, size: 48),
                  const SizedBox(height: 16),
              
                  if (snapshot.error is ClientException) //bug: capturar la excepcion correcta
                    Text("Error conexion:", style: TextStyle(fontSize: 8, color: Colors.red)),
                    Text(snapshot.error.toString()),
                    const SizedBox(height: 12),
                  
                  ElevatedButton(
                    onPressed: retryGetCompraventas, 
                    child: const Text('Reintentar'))                  
                ],
              ),
            ),
          );
        }

        final compraventas = snapshot.data ?? [];

        if(compraventas.isEmpty){
          
        }

        return _ListCompraventas(
          compraVentas: compraventas, 
          favoriteId: favoriteId,
          onFavoriteTap: toggleFavorite,
          onCompraventaTap: (compraventa) {
            Navigator.of(context).pushNamed(
              AppRoutes.compraventaDetail,
              arguments: compraventa
            );
          }
        );
      },
    );

  }
}


//Widget lista compraventas
class _ListCompraventas extends StatelessWidget {

  final List<CompraVenta> compraVentas;
  final int? favoriteId;
  final ValueChanged<int> onFavoriteTap;
  final ValueChanged<CompraVenta> onCompraventaTap;

  const new({
    required this.compraVentas,
    this.favoriteId,
    required this.onFavoriteTap,
    required this.onCompraventaTap,
  });


  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: compraVentas.length,
      itemBuilder:(context,index) {

      final compraventa = compraVentas[index];
    
      return ItemCard(
        compraventa: compraventa, 
        isFavorite: favoriteId == index,
        onFavoriteTap: () => {
          onFavoriteTap(compraventa.id)
        },
        onTap: () => onCompraventaTap(compraventa)
        );
    },
    
    );
  }
}