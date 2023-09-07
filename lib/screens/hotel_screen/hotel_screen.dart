import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/repo/hotel_repo.dart';
import 'package:hotel/screens/hotel_screen/bloc/hotel_bloc.dart';
import 'package:hotel/screens/hotel_screen/widgets/detail_hotel_data_buttons.dart';
import 'package:hotel/screens/hotel_screen/widgets/main_hotel_data.dart';
import 'package:hotel/screens/room_screen/room_screen.dart';
import 'package:hotel/widgets/bottom_navigation_button.dart';
import 'package:hotel/widgets/peculiarity.dart';
import 'package:hotel/widgets/white_island.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late final HotelBloc _bloc;

  @override
  void initState() {
    _bloc = HotelBloc(ApiHotelRepo());

    _bloc.add(HotelEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отель'),
        elevation: 0,
      ),
      body: BlocBuilder<HotelBloc, HotelState>(
          bloc: _bloc,
          builder: (context, state) {
            return switch (state) {
              HotelDataState() => Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          MainHotelData(
                            hotel: state.hotel,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          WhiteIsland(
                            padding: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Об отеле',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 5,
                                  children: [
                                    ...?state.hotel.peculiarities?.map(
                                      (e) => Peculiarity(
                                        text: e,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  state.hotel.description ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const DetailHotelDataButtons(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    BottomNavigationButton(
                      label: 'К выбору номера',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoomScreen(
                                      hotel: state.hotel,
                                    )));
                      },
                    ),
                  ],
                ),
              HotelErrorState() => Center(
                  child: Text(state.message ?? ''),
                ),
              HotelLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
            };
          }),
    );
  }
}
