import 'package:ecommers_new/providers/carousel_provider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:provider/provider.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Se realiza la llamada para obtener las imágenes.
      context.read<CarouselProvider>().fetchImageURLs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final carouselProvider = context.watch<CarouselProvider>();

    return carouselProvider.isLoading
        ? const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    )
        : GFCarousel(
      items: carouselProvider.imageURLs.map((url) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      }).toList(),
      onPageChanged: (index) {
        // Puedes implementar lógica adicional aquí si se necesita.
      },
    );
  }
}