import 'package:bloc/bloc.dart';
import 'package:hotel/models/hotel.dart';
import 'package:hotel/repo/hotel_repo.dart';
import 'package:meta/meta.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepo _repo;

  HotelBloc(this._repo) : super(HotelLoadingState()) {
    on<HotelFetchEvent>(_fetch);
  }

  Future<void> _fetch(HotelFetchEvent event, Emitter<HotelState> emit) async {
    try {
      emit(HotelLoadingState());

      final hotel = await _repo.getHotel();

      emit(HotelDataState(hotel));
    } catch (e) {
      emit(HotelErrorState(e.toString()));
    }
  }
}
