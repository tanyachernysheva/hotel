import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel/repo/booking_repo.dart';
import 'package:hotel/screens/booking_screen/bloc/booking_bloc.dart';
import 'package:hotel/widgets/bottom_navigation_button.dart';
import 'package:hotel/widgets/white_island.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late final BookingBloc _bloc;
  @override
  void initState() {
    _bloc = BookingBloc(ApiBookingRepo());
    _bloc.add(const BookingEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бронирование'),
        elevation: 0,
      ),
      body: BlocBuilder<BookingBloc, BookingState>(
        bloc: _bloc,
        builder: (context, state) {
          return switch (state) {
            BookingDataState() => Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        WhiteIsland(
                          padding: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                state.booking?.hotelName ?? '---',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                state.booking?.hotelAdress ?? '---',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        WhiteIsland(
                          padding: 16,
                          child: Column(
                            children: <Widget>[
                              InfoRow(
                                about: 'Вылет из',
                                info: state.booking?.departure,
                              ),
                              InfoRow(
                                about: 'Страна, город',
                                info: state.booking?.arrivalCountry,
                              ),
                              InfoRow(
                                about: 'Даты',
                                info:
                                    '${state.booking?.tourDateStart} – ${state.booking?.tourDateStop}',
                              ),
                              InfoRow(
                                about: 'Кол-во ночей',
                                info: '${state.booking?.numberOfNights} ночей',
                              ),
                              InfoRow(
                                about: 'Отель',
                                info: state.booking?.hotelName,
                              ),
                              InfoRow(
                                about: 'Номер',
                                info: state.booking?.room,
                              ),
                              InfoRow(
                                about: 'Питание',
                                info: state.booking?.nutrition,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        WhiteIsland(
                          padding: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Информация о покупателе',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const CustomTextField(
                                label: 'Номер телефона',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const CustomTextField(
                                label: 'Почта',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту.',
                                style: TextStyle(
                                    color: Color.fromRGBO(130, 135, 150, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        WhiteIsland(
                          padding: 16,
                          child: Column(
                            children: <Widget>[
                              InfoRow(
                                about: 'Тур',
                                info: '${state.booking?.tourPrice} ₽',
                              ),
                              InfoRow(
                                about: 'Топливный сбор',
                                info: '${state.booking?.fuelCharge} ₽',
                              ),
                              InfoRow(
                                about: 'Сервисный сбор',
                                info: '${state.booking?.serviceCharge} ₽',
                              ),
                              InfoRow(
                                about: 'К оплате',
                                info:
                                    '${(state.booking?.serviceCharge ?? 0) + (state.booking?.fuelCharge ?? 0) + (state.booking?.tourPrice ?? 0)} ₽',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  BottomNavigationButton(
                    label:
                        'Оплатить ${(state.booking?.serviceCharge ?? 0) + (state.booking?.fuelCharge ?? 0) + (state.booking?.tourPrice ?? 0)} ₽',
                    onPressed: () {},
                  ),
                ],
              ),
            BookingLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            BookingErrorState() => Center(
                child: Text(state.message ?? ''),
              ),
          };
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(246, 246, 249, 1),
        filled: true,
        labelText: label,
        hoverColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String? about;
  final String? info;

  const InfoRow({
    super.key,
    this.about,
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                about ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(130, 135, 150, 1),
                ),
              ),
            ),
            Expanded(child: Text(info ?? '')),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
