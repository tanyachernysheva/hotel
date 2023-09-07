part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {
  const BookingEvent();

  const factory BookingEvent.fetch() = _BookingFetchEvent;
}

final class _BookingFetchEvent implements BookingEvent {
  const _BookingFetchEvent();
}
