part of 'room_bloc.dart';

@immutable
sealed class RoomState {
  const RoomState();
}

final class RoomDataState extends RoomState {
  final List<Room>? rooms;

  const RoomDataState({this.rooms});
}

final class RoomLoadingState extends RoomState {
  const RoomLoadingState();
}

final class RoomErrorState extends RoomState {
  final String? message;

  const RoomErrorState({this.message});
}
