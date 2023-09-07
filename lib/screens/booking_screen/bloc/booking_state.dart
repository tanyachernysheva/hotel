part of 'booking_bloc.dart';

@immutable
sealed class BookingState {
  const BookingState();
}

final class BookingLoadingState extends BookingState {
  const BookingLoadingState();
}

final class BookingDataState extends BookingState {
  final Booking? booking;

  const BookingDataState({this.booking});
}

final class BookingErrorState extends BookingState {
  final String? message;

  const BookingErrorState({this.message});
}
