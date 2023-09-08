import 'package:flutter/material.dart';
import 'package:hotel/widgets/carousel_indicator.dart';

class CarouselSlider extends StatefulWidget {
  final List<String> images;
  const CarouselSlider({super.key, required this.images});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 257,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              final image = widget.images[index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 8,
            child: CarouselIndicator(
              itemCount: widget.images.length,
              currentIndex: _currentPageIndex,
            ),
          ),
        ],
      ),
    );
  }
}
