class CompraVenta{
  int id;
  String title;
  String category;
  int price;
  int tiempoDeUso;
  String estatus;
  bool isNew;
  String imagePath;
  String description;
  


  CompraVenta({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.tiempoDeUso,
    required this.estatus,
    this.isNew = false,
    required this.imagePath,
    required this.description,
  });
}
