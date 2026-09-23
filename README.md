# Compraventa

Aplicación Flutter para publicar y consultar artículos de compraventa
organizados por categorías, como vehículos y electrodomésticos.

## Estado actual

La aplicación contiene un MVP ejecutable con:

- Datos de ejemplo en memoria.
- Lista de artículos en la pantalla principal.
- Indicador de carga y mensaje de error.
- Navegación desde una tarjeta hacia el detalle del artículo.
- Modelo `CompraVenta` con información básica del artículo.

La fuente de datos en memoria es intencional en esta primera etapa. La
persistencia y la conexión con una API se incorporarán en fases posteriores.

## Requisitos y ejecución

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Roadmap del producto

Cada funcionalidad debe desarrollarse en una rama pequeña y fusionarse mediante
un commit que deje el proyecto compilando y probado.

### Fase 0: base app compraventa

- [x] Crear el proyecto Flutter.
- [x] Mostrar artículos de ejemplo en memoria.
- [x] Construir lista de articulos en pantalla principal
- [x] Construir card para cada articulo
- [x] Navegar de la lista al detalle.

