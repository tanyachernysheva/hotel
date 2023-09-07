final class Booking {
  final int? id;
  final String? hotelName;
  final String? hotelAdress;
  final int? horating;
  final String? ratingName;
  final String? departure;
  final String? arrivalCountry;
  final String? tourDateStart;
  final String? tourDateStop;
  final int? numberOfNights;
  final String? room;
  final String? nutrition;
  final int? tourPrice;
  final int? fuelCharge;
  final int? serviceCharge;

  Booking({
    this.id,
    this.hotelName,
    this.hotelAdress,
    this.horating,
    this.ratingName,
    this.departure,
    this.arrivalCountry,
    this.tourDateStart,
    this.tourDateStop,
    this.numberOfNights,
    this.room,
    this.nutrition,
    this.tourPrice,
    this.fuelCharge,
    this.serviceCharge,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      hotelName: json['hotel_name'],
      hotelAdress: json['hotel_adress'],
      horating: json['horating'],
      ratingName: json['ratingName'],
      departure: json['departure'],
      arrivalCountry: json['arrival_country'],
      tourDateStart: json['tour_date_start'],
      tourDateStop: json['tour_date_stop'],
      numberOfNights: json['number_of_nights'],
      room: json['room'],
      nutrition: json['nutrition'],
      tourPrice: json['tour_price'],
      fuelCharge: json['fuel_charge'],
      serviceCharge: json['service_charge'],
    );
  }
}
