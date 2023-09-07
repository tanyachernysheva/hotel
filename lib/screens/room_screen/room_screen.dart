import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/models/hotel.dart';
import 'package:hotel/repo/room_repo.dart';
import 'package:hotel/screens/room_screen/bloc/room_bloc.dart';
import 'package:hotel/screens/room_screen/widgets/room_card.dart';

class RoomScreen extends StatefulWidget {
  final Hotel? hotel;
  const RoomScreen({super.key, this.hotel});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late final RoomBloc _bloc;

  @override
  void initState() {
    _bloc = RoomBloc(ApiRoomRepo());

    _bloc.add(const RoomEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel?.name ?? 'Отель'),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocBuilder<RoomBloc, RoomState>(
          bloc: _bloc,
          builder: (context, state) {
            return switch (state) {
              RoomDataState() => Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          ...?state.rooms?.map(
                            (room) => RoomCard(
                              room: room,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              RoomErrorState() => Center(
                  child: Text(state.message ?? ''),
                ),
              RoomLoadingState() => const Center(
                  child: CircularProgressIndicator(),
                ),
            };
          },
        ),
      ),
    );
  }
}
