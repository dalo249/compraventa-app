import 'package:flutter_application_2/presentation/screens/compraventa_detail.dart';
import 'package:flutter_application_2/presentation/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/router/app_routes.dart';
import '../../models/compraventa.dart';

class CompraventaScreen extends StatefulWidget {
  const CompraventaScreen({super.key});

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

  void toggleFavorite(int compraventaId){
    setState(() {
      favoriteId = favoriteId == compraventaId ? null: compraventaId;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCompraVenta();
  }

  // Simula una operación asíncrona, como consultar una API.
  Future<List<CompraVenta>> loadCompraVenta() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return [
      CompraVenta(
        id: 1,
        title: 'Carro',
        category: 'Vehiculo',
        price: 15,
        tiempoDeUso: 3,
        estatus: 'Disponible',
        isNew: true,
        imagePath: 'assets/images/carro.png',
        description: 'Un carro en buen estado, ideal para la ciudad.',
      ),
      CompraVenta(
        id: 2,
        title: 'Motocicleta',
        category: 'vehiculo',
        price: 12,
        tiempoDeUso: 2,
        estatus: 'Disponible',
        isNew: false,
        imagePath: 'assets/images/motocicleta.png',
        description: 'Una motocicleta rápida y eficiente para tus desplazamientos.',
      ),
      CompraVenta(
        id: 3,
        title: 'Lavadora',
        category: 'Electrodoméstico',
        price: 18,
        tiempoDeUso: 4,
        estatus: 'Disponible',
        isNew: true,
        imagePath: 'assets/images/lavadora.png',
        description: 'Una lavadora de alta capacidad para tu hogar.',
      ),
    ];
  }

  // Esta función se construirá progresivamente durante la clase.
  Future<void> fetchCompraVenta() async {
    // CHECKPOINTS DE LA CLASE:
    // 1. Activar el estado de carga.
    // 2. Esperar los datos.
    // 3. Guardar las películas.
    // 4. Finalizar la carga.
    // 5. Manejar un posible error.
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      final data = await loadCompraVenta();
      setState(() {
        compraVentas = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error al cargar los datos';
        isLoading = false;
      });
    } finally {
    
    }
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
    // Empezamos con una interfaz mínima que ya funciona.
    // Este método evolucionará durante los checkpoints.
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (errorMessage.isNotEmpty) {
      return Center(
        child: Text(errorMessage),
      );
    }
    if(compraVentas.isEmpty){
      return Center( 
        child:ElevatedButton(
          onPressed: fetchCompraVenta,
          child: const Text('Cargar compras y ventas')
      ));
      
    }
    return ListView.builder(itemCount: compraVentas.length,
     itemBuilder:(context,index) {
      final compraventa = compraVentas[index];

      return ItemCard(
        compraventa: compraventa, 
        isFavorite: favoriteId == index,
        onFavoriteTap: () => toggleFavorite(index),
        onTap: () => {
          Navigator.of(context).pushNamed(
            AppRoutes.compraventaDetail,
            arguments: compraventa
            )
      });
    },

    );


  }
}