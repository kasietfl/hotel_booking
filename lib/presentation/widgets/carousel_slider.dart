import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageSlider extends StatefulWidget {
  final List<String> photoUrls;
  const CarouselImageSlider({super.key, required this.photoUrls});

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: widget.photoUrls.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        CachedNetworkImageProvider(widget.photoUrls[index]))),
          ),
          options: CarouselOptions(
            height: 257.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: buildCustomIndicator(currentIndex),
        )
      ],
    );
  }

  Widget buildCustomIndicator(int currentIndex) {
    List<Container> indicators = [];
    for (int i = 0; i < widget.photoUrls.length; i++) {
      indicators.add(
        Container(
          width: 7,
          height: 7,
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == i
                ? Colors.black
                : Colors.black.withOpacity(.22),
          ),
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: indicators,
      ),
    );
  }
}
