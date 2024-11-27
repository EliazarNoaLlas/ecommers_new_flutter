# eCommerce Flutter App

## Descripción del Proyecto

Esta es una aplicación de comercio electrónico desarrollada con Flutter, que ofrece una experiencia completa de compras móviles con múltiples funcionalidades.

## Características Principales

- Autenticación de usuarios (incluyendo inicio de sesión con Google)
- Exploración de productos por categorías
- Búsqueda de productos
- Carrito de compras
- Gestión de pedidos
- Favoritos
- Checkout integrado con Stripe

## Estructura del Proyecto

```
lib/
├── main.dart
├── constants.dart
├── size_config.dart
├── models/
│   ├── account_choice.dart
│   ├── category.dart
│   ├── product.dart
│   └── cart/
│       ├── address.dart
│       ├── order.dart
│       └── order_product.dart
├── providers/
│   ├── UserProvider.dart
│   ├── address_provider.dart
│   ├── carousel_provider.dart
│   └── product/
│       ├── product_provider.dart
│       └── search_product_provider.dart
├── screens/
│   ├── home/
│   ├── cart/
│   ├── search/
│   ├── details/
│   └── account/
├── services/
│   ├── login_api.dart
│   ├── register_api.dart
│   └── product/
│       ├── product_detail_api.dart
│       └── trend_product_api.dart
└── utils/
    ├── user_search_history.dart
    └── user_secure_storage.dart
```

## Requisitos Previos

- Flutter SDK
- Dart
- Android Studio o VS Code con complementos de Flutter
- Cuenta de Google para autenticación (opcional)
- Cuenta de Stripe para pagos (opcional)

## Configuración del Proyecto

1. Clonar el repositorio
```bash
git clone https://github.com/EliazarNoaLlas/ecommers_new_flutter.git
```

2. Instalar dependencias
```bash
flutter pub get
```

3. Configurar variables de entorno
- Configurar credenciales de Google Sign-In
- Configurar credenciales de Stripe
- Configurar endpoints de API

## Ejecución

```bash
# Modo de depuración
flutter run

# Generar versión de producción
flutter build apk
flutter build ios
```

## Tecnologías Utilizadas

- **Flutter**
- **Dart**
- **Provider** (State Management)
- **Google Sign-In**
- **Stripe**
- **HTTP** para llamadas a API

## Contribución

1. Haz un *fork* del proyecto
2. Crea tu rama de características (`git checkout -b feature/nueva-caracteristica`)
3. Confirma tus cambios (`git commit -m 'Añadir nueva característica'`)
4. Sube tu rama (`git push origin feature/nueva-caracteristica`)
5. Abre un *Pull Request*

## Licencia

[Especificar la licencia, por ejemplo MIT]

## Contacto

**Nombre del Desarrollador**
- **Email**: tu.email@ejemplo.com
- **LinkedIn**: [Perfil de LinkedIn]
- **Sitio web**: [Tu sitio web]

## Capturas de Pantalla

*[Próximamente]*

## Problemas Conocidos

- Rendimiento en dispositivos de gama baja
- Posibles errores en la integración de pagos
- Límite de búsquedas recientes

## Próximas Mejoras

- [ ] Implementar más métodos de pago
- [ ] Mejorar la experiencia de búsqueda
- [ ] Añadir notificaciones push
- [ ] Optimizar rendimiento
- [ ] Internacionalización de la aplicación

**¡Gracias por tu interés en el proyecto!**
