part of 'hotel_bloc.dart';

@immutable
sealed class HotelState {
  const HotelState();
}

final class HotelLoadingState extends HotelState {}

final class HotelDataState extends HotelState {
  final Hotel hotel;

  const HotelDataState(this.hotel);
}

final class HotelErrorState extends HotelState {
  final String? message;

  const HotelErrorState(this.message);
}
