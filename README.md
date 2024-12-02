# eCommerce Flutter App

## Descripción del Proyecto

Un sitio web de comercio electrónico utilizando mi [API del servidor web de Django(https://github.com/emrecoskun705/e_commerce)].

El propósito de este proyecto fue únicamente educativo. Quería simular la relación entre una aplicación móvil y un servidor web, y hacer que esta relación sea lo más segura posible. La mayor parte de la seguridad se encuentra en mi [API del servidor web de Django(https://github.com/emrecoskun705/e_commerce)].


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
- 
- [ ] Optimizar rendimiento
- [ ] Internacionalización de la aplicación

**¡Gracias por tu interés en el proyecto!**

## Tecnología

En la aplicación móvil he utilizado Provider como gestor de estado.

- Flutter 2.2.3
- Dart 2.13.4
- Todos los demás requisitos están en el archivo `pubspec.yaml`
- API de Google para autenticación con Google utilizando [[API del servidor web de Django]](https://github.com/emrecoskun705/e_commerce)

## Ejemplo de uso


https://user-images.githubusercontent.com/57330864/134556977-b3fb6c10-95da-4df4-8d46-e37961ec6b8d.mp4