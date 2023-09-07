import 'package:bloc/bloc.dart';
import 'package:hotel/models/booking.dart';
import 'package:hotel/repo/booking_repo.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepo _repo;

  BookingBloc(this._repo) : super(const BookingLoadingState()) {
    on<BookingEvent>(_fetch);
  }

  Future<void> _fetch(BookingEvent event, Emitter<BookingState> emit) async {
    try {
      emit(const BookingLoadingState());

      final booking = await _repo.getBooking();

      emit(BookingDataState(booking: booking));
    } catch (e) {
      emit(BookingErrorState(message: e.toString()));
    }
  }
}
