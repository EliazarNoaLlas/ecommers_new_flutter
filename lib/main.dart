/// Archivo: main.dart
/// Propósito: Punto de entrada principal de la aplicación de e-commerce
/// Autor: [Tu Nombre]
/// Última modificación: 01/12/2024
///
/// Descripción: Configura los proveedores de estado global y
/// establece la estructura initial de la aplicación
library;

// Importaciones de proveedores de estado
import 'package:ecommers_new/providers/carousel_provider.dart';
import 'package:ecommers_new/providers/order_provider.dart';
import 'package:ecommers_new/providers/persistent_tab_provider.dart';
import 'package:ecommers_new/providers/product/trend_product_provider.dart';
import 'package:ecommers_new/providers/UserProvider.dart';
import 'package:ecommers_new/providers/search_history_provider.dart';

// Importaciones de Flutter y librerías de terceros
import 'package:flutter/material.dart';
import 'package:ecommers_new/screens/main_screen.dart';
import 'package:provider/provider.dart';

/// Función principal que inicializa la aplicación
/// Configura los proveedores de estado global utilizando MultiProvider
void main() async {
  // Ejecuta la aplicación con múltiples proveedores para gestión de estado
  runApp(
    MultiProvider(
      // Lista de proveedores de estado que se utilizarán en toda la aplicación
      providers: [
        // Proveedor para la gestión de datos de usuario
        ChangeNotifierProvider(create: (_) => UserProvider()),

        // Proveedor para mantener el estado persistente de las pestañas
        ChangeNotifierProvider(create: (_) => PersistentTabProvider()),

        // Proveedor para productos de tendencia
        ChangeNotifierProvider(create: (_) => TrendProductProvider()),

        // Proveedor para la gestión de pedidos
        ChangeNotifierProvider(create: (_) => OrderProvider()),

        // Proveedor para el historial de búsqueda
        ChangeNotifierProvider(create: (_) => SearchHistoryProvider()),

        // Proveedor para el carrusel de imágenes
        ChangeNotifierProvider(create: (_) => CarouselProvider()),
      ],
      // Widget raíz de la aplicación
      child: const MyApp(),
    ),
  );
}

/// Widget principal de la aplicación que define la configuración
/// general de la interfaz de usuario
class MyApp extends StatelessWidget {
  /// Constructor constante con llave de superclase
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración del MaterialApp como widget raíz
    return MaterialApp(
      // Pantalla principal de la aplicación
      // Se puede añadir más configuración como theme, título, etc.
      home: MainScreen(),
    );
  }
}