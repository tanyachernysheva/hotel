part of 'hotel_bloc.dart';

@immutable
sealed class HotelEvent {
  const HotelEvent();

  factory HotelEvent.fetch() = _HotelFetchEvent;
}

final class _HotelFetchEvent implements HotelEvent {}
