class CompraVenta {
  final int id;
  final String title;
  final int categoryId;
  final num price;
  final int tiempoDeUso;
  final String status;
  final bool isNew;
  final String? imagePath;
  final String description;

  CompraVenta({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.price,
    required this.tiempoDeUso,
    required this.status,
    required this.isNew,
    this.imagePath, 
    required this.description,
  });

  factory CompraVenta.fromJson(Map<String, dynamic> json) {
    final rawId = json['id'];
    final id = rawId is int ? rawId : int.parse(rawId.toString()); //API jsonServer solo genera id texto

    final title = json['title'];
    final categoryId = json['category_id'];
    final price = json['price'];
    final tiempoDeUso = json['tiempo_de_uso'];
    final status = json['status'];
    final isNew = json['is_new'];
    final imagePath = json['image_path'];
    final description = json['description'];


    if (title is! String) {
      throw const FormatException('titulo debe ser string');
    }
    if (categoryId is! int) {
      throw const FormatException('id de categoria debe ser entero');
    }
    if (price is! num) {
      throw const FormatException('precio debe ser numerico');
    }
    if (tiempoDeUso is! int) {
      throw const FormatException('tiempo de uso debe ser entero');
    }
    if (status is! String) {
      throw const FormatException('estado debe ser string');
    }
    if (isNew is! bool) {
      throw const FormatException('es nuevo debe ser booleano');
    }
    if (imagePath != null && imagePath is! String) {
      throw const FormatException('ruta de imagen debe ser string');
    }
    if (description is! String) {
      throw const FormatException('descripcion debe ser string');
    }

    return CompraVenta(
      id: id,
      title: title,
      categoryId: categoryId,
      price: price,
      tiempoDeUso: tiempoDeUso,
      status: status,
      isNew: isNew,
      imagePath: imagePath,
      description: description,
    );
  }
}