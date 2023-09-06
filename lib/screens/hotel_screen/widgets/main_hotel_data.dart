import 'package:flutter/material.dart';
import 'package:hotel/models/hotel.dart';
import 'package:hotel/widgets/carousel_slider.dart';

class MainHotelData extends StatelessWidget {
  final Hotel? hotel;

  const MainHotelData({
    super.key,
    this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(12),
          bottomStart: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CarouselSlider(
            images: hotel?.imageUrls ?? [],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(255, 199, 0, 0.2),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Color.fromRGBO(255, 168, 0, 1),
                            size: 15,
                          ),
                          Text(
                            '${hotel?.rating ?? '---'} ${hotel?.ratingName ?? '---'}',
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 168, 0, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  hotel?.name ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    hotel?.adress ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'от ${hotel?.minimalPrice ?? '----'} ₽',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      hotel?.priceForIt ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(130, 135, 150, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
