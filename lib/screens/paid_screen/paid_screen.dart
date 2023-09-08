import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel/screens/hotel_screen/hotel_screen.dart';
import 'package:hotel/widgets/bottom_navigation_button.dart';

class PaidScreen extends StatelessWidget {
  final int number = Random().nextInt(100);
  PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 94,
                      height: 94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(246, 246, 249, 1),
                      ),
                      child: Image.asset('assets/party_popper.png'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Ваш заказ принят в работу',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(130, 135, 150, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationButton(
              label: 'Супер!',
              onPressed: () => context.goNamed(HotelScreen.name),
            ),
          ],
        ),
      ),
    );
  }
}
