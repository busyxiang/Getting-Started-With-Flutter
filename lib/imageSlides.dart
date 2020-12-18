import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlides extends StatelessWidget {
  final imagesList;

  ImageSlides(this.imagesList);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = new List<Widget>();
    for (var i = 0; i < this.imagesList.length; i++) {
      imageSliders.add(Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(
                this.imagesList[i],
                height: 500,
                fit: BoxFit.contain
              ),
            ],
          ),
        ),
      ));
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
      items: imageSliders,
    );
  }
}
