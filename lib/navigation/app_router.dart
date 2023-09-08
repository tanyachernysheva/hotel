import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel/screens/booking_screen/booking_screen.dart';
import 'package:hotel/screens/hotel_screen/hotel_screen.dart';
import 'package:hotel/screens/paid_screen/paid_screen.dart';
import 'package:hotel/screens/room_screen/room_screen.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: HotelScreen.name,
        path: HotelScreen.path,
        builder: (BuildContext context, GoRouterState state) {
          return const HotelScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            name: RoomScreen.name,
            path: RoomScreen.path,
            builder: (BuildContext context, GoRouterState state) {
              return RoomScreen(
                hotelName: state.extra as String?,
              );
            },
          ),
          GoRoute(
            path: BookingScreen.path,
            builder: (BuildContext context, GoRouterState state) {
              return const BookingScreen();
            },
          ),
          GoRoute(
            path: PaidScreen.path,
            builder: (BuildContext context, GoRouterState state) {
              return PaidScreen();
            },
          ),
        ],
      ),
    ],
  );
}
