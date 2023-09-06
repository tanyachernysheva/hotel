part of 'hotel_bloc.dart';

@immutable
sealed class HotelEvent {
  const HotelEvent();

  factory HotelEvent.fetch() = HotelFetchEvent;
}

final class HotelFetchEvent implements HotelEvent {}
