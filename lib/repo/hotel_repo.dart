import 'package:hotel/api_endpoints.dart';
import 'package:hotel/httpClient/http_client.dart';
import 'package:hotel/models/hotel.dart';

abstract interface class HotelRepo {
  Future<Hotel> getHotel();
}

final class ApiHotelRepo implements HotelRepo {
  final HttpClient _httpClient;

  ApiHotelRepo() : _httpClient = HttpClient();

  @override
  Future<Hotel> getHotel() async {
    final json =
        await _httpClient.get(ApiEndpoints.hotelUrl) as Map<String, dynamic>;

    final Hotel hotel = Hotel.fromJson(json);

    return hotel;
  }
}
