import 'package:bloc/bloc.dart';
import 'package:hotel/models/room.dart';
import 'package:hotel/repo/room_repo.dart';
import 'package:meta/meta.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomRepo _repo;

  RoomBloc(this._repo) : super(const RoomLoadingState()) {
    on<_RoomFetchEvent>(_fetch);
  }

  Future<void> _fetch(_RoomFetchEvent event, Emitter<RoomState> emit) async {
    try {
      emit(const RoomLoadingState());

      final rooms = await _repo.getRooms();

      emit(RoomDataState(rooms: rooms));
    } catch (e) {
      emit(RoomErrorState(message: e.toString()));
    }
  }
}
