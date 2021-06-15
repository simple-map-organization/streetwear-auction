import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarouselScreen extends StatelessWidget {
  static const routeName = '/imageCarousel';
  static MaterialPageRoute createRoute(args) => MaterialPageRoute(
      builder: (_) => ImageCarouselScreen(args['images'], args['index'] ?? 0));

  final List<Image> _images;
  final int _index;
  ImageCarouselScreen(this._images, this._index);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          initialPage: _index,
          height: height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
        ),
        items: _images
            .map(
              (image) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: image,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
