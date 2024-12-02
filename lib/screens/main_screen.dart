/// Archivo: main_screen.dart
/// Propósito: Pantalla principal con navegación persistente de bottom navigation bar
/// Autor: [Tu Nombre]
/// Última modificación: 01/12/2024
///
/// Descripción: Implementa la estructura de navegación principal de la aplicación
/// utilizando una barra de navegación inferior persistente con diferentes pantallas
library;

// Importaciones de proveedores
import 'package:ecommers_new/providers/UserProvider.dart';
import 'package:ecommers_new/providers/order_provider.dart';
import 'package:ecommers_new/providers/persistent_tab_provider.dart';

// Importaciones de pantallas
import 'package:ecommers_new/screens/account/account_screen.dart';
import 'package:ecommers_new/screens/cart/cart_screen.dart';
import 'package:ecommers_new/screens/category/category_screen.dart';
import 'package:ecommers_new/screens/home/home_screen.dart';

// Importaciones de servicios y Flutter
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../size_config.dart';

/// Pantalla principal de la aplicación con navegación persistente
/// Gestiona la estructura de navegación entre diferentes secciones
class MainScreen extends StatefulWidget {
  /// Constructor constante con llave de superclase
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

/// Estado de la pantalla principal que maneja la navegación
class _MainScreenState extends State<MainScreen> {
  /// Lista de pantallas para la navegación
  /// Cada índice corresponde a una sección de la aplicación
  final List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(
      slug: 'root',
      showAll: false,
    ),
    CartScreen(),
    AccountScreen(),
  ];

  /// Construye los elementos de la barra de navegación inferior
  ///
  /// Configura los iconos, títulos y colores para cada elemento de navegación
  List<PersistentBottomNavBarItem> _navbarItems() {
    return [
      // Elemento de navegación para Inicio
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      // Elemento de navegación para Categorías
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category),
        title: ("Categories"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      // Elemento de navegación para Carrito
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        // Acción personalizada al presionar el botón de carrito
        onPressed: (_) {
          // Verifica si el usuario está logged in antes de cargar el pedido
          if (context.read<UserProvider>().isLoggedIn) {
            // Obtiene los pedidos del usuario actual
            Provider.of<OrderProvider>(context, listen: false).fetchOrder();
          }
          // Cambia a la pestaña de carrito
          Provider.of<PersistentTabProvider>(context, listen: false)
              .changeTab(2);
        },
      ),
      // Elemento de navegación para Cuenta
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Account"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Inicializa la configuración de tamaño para la interfaz
    SizeConfig().init(context);

    // Obtiene el controlador de pestañas desde el proveedor
    final PersistentTabController controller =
        Provider.of<PersistentTabProvider>(context).controller;

    // Construye el Scaffold con la vista de pestañas persistentes
    return Scaffold(
      body: buildPersistentTabView(context, controller),
    );
  }

  /// Construye la vista de pestañas persistentes
  ///
  /// [context] Contexto de la aplicación
  /// [controller] Controlador de pestañas para manejar la navegación
  /// Retorna un widget PersistentTabView configurado
  PersistentTabView buildPersistentTabView(
      BuildContext context, PersistentTabController controller) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: _navbarItems(),
      // Estilo de navegación personalizado
      navBarStyle: NavBarStyle.style6,
      backgroundColor: Colors.white,
      // Decoración de la barra de navegación
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color(0xFF8ECAE6),
      ),
    );
  }
}
