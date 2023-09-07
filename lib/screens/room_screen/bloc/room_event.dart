part of 'room_bloc.dart';

@immutable
sealed class RoomEvent {
  const RoomEvent();

  const factory RoomEvent.fetch() = _RoomFetchEvent;
}

final class _RoomFetchEvent implements RoomEvent {
  const _RoomFetchEvent();
}
