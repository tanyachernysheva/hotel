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
            path: 'room',
            builder: (BuildContext context, GoRouterState state) {
              return const RoomScreen();
            },
          ),
          GoRoute(
            path: 'booking',
            builder: (BuildContext context, GoRouterState state) {
              return const BookingScreen();
            },
          ),
          GoRoute(
            path: 'paid',
            builder: (BuildContext context, GoRouterState state) {
              return PaidScreen();
            },
          ),
        ],
      ),
    ],
  );
}
