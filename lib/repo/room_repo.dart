import 'package:hotel/api_endpoints.dart';
import 'package:hotel/httpClient/http_client.dart';
import 'package:hotel/models/room.dart';

abstract interface class RoomRepo {
  Future<List<Room>> getRooms();
}

final class ApiRoomRepo implements RoomRepo {
  final HttpClient _httpClient;
  final List<Room> rooms = [];

  ApiRoomRepo() : _httpClient = HttpClient();

  @override
  Future<List<Room>> getRooms() async {
    final json =
        await _httpClient.get(ApiEndpoints.roomUrl) as Map<String, dynamic>;

    for (final i in json['rooms']) {
      rooms.add(Room.fromJson(i));
    }

    return rooms;
  }
}
