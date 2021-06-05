import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../image_carousel/image_carousel.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<String> images;
  ImageCarouselWidget(this.images);

  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(width: double.infinity, height: 200),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 200.0,
                viewportFraction: 1.0,
                onPageChanged: (currentPage, _) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                }),
            items: widget.images
                .map((image) => InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            ImageCarouselScreen.routeName,
                            arguments: {
                              'images': widget.images,
                              'index': widget.images.indexOf(image)
                            });
                      },
                      child: Container(
                          width: double.infinity,
                          child: Image.network(
                            image,
                            fit: BoxFit.contain,
                          )),
                    ))
                .toList(),
          ),
          Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text('${_currentPage + 1}/${widget.images.length}'))
        ],
      ),
    );
  }
}
