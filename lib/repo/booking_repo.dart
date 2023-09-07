import 'package:hotel/api_endpoints.dart';
import 'package:hotel/httpClient/http_client.dart';
import 'package:hotel/models/booking.dart';

abstract interface class BookingRepo {
  Future<Booking> getBooking();
}

final class ApiBookingRepo implements BookingRepo {
  final HttpClient _httpClient;

  ApiBookingRepo() : _httpClient = HttpClient();

  @override
  Future<Booking> getBooking() async {
    final json =
        await _httpClient.get(ApiEndpoints.bookingUrl) as Map<String, dynamic>;

    final Booking booking = Booking.fromJson(json);

    return booking;
  }
}
