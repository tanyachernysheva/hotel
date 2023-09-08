import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel/models/room.dart';
import 'package:hotel/widgets/carousel_slider.dart';
import 'package:hotel/widgets/custom_button.dart';
import 'package:hotel/widgets/peculiarity.dart';
import 'package:hotel/widgets/white_island.dart';

class RoomCard extends StatelessWidget {
  final Room? room;

  const RoomCard({
    super.key,
    this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        WhiteIsland(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 16,
              ),
              CarouselSlider(images: room?.imageUrls ?? []),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      room?.name ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 5,
                      children: [
                        ...?room?.peculiarities?.map((e) => Peculiarity(
                              text: e,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(43, 13, 114, 255),
                              shadowColor: Colors.transparent,
                              foregroundColor:
                                  const Color.fromRGBO(13, 114, 255, 1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Подробнее о номере',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '${room?.price ?? '---'} ₽',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          room?.pricePer ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(130, 135, 150, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      text: 'Выбрать номер',
                      onPressed: () => context.go('/booking'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
