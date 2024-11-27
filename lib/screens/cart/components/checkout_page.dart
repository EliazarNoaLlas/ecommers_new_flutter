import 'package:ecommers_new/constants.dart';
import 'package:ecommers_new/providers/stripe_provider.dart';
import 'package:ecommers_new/screens/components/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';

String checkoutSuccessUrl = '$kServerApiURL/stripe/success/';
String checkoutCancelUrl = '$kServerApiURL/stripe/cancel/';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late WebViewController _controller;
  final StripeProvider _stripeProvider = StripeProvider();

  @override
  void initState() {
    super.initState();

    // Inicializar el controlador WebView
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(checkoutSuccessUrl)) {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Your order has been successfully created'),
              ));
            } else if (request.url.startsWith(checkoutCancelUrl)) {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Your order has been canceled'),
              ));
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    // Cargar la URL de Stripe una vez inicializado el controlador
    _stripeProvider.fetchStripeURL().then((_) {
      if (mounted) {
        final stripeURL = _stripeProvider.stripeURL;

        // Validar si stripeURL no es null antes de usarla
        if (stripeURL != null && stripeURL.isNotEmpty) {
          _controller.loadRequest(Uri.parse(stripeURL));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error: Stripe URL not available'),
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _stripeProvider,
      child: Consumer<StripeProvider>(
        builder: (context, data, _) {
          if (data.isLoading) {
            return LoadingScreen();
          } else {
            return WebViewWidget(
              controller: _controller,
            );
          }
        },
      ),
    );
  }
}
