import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel/repo/booking_repo.dart';
import 'package:hotel/screens/booking_screen/bloc/booking_bloc.dart';
import 'package:hotel/widgets/bottom_navigation_button.dart';
import 'package:hotel/widgets/white_island.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  static const path = 'booking';

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late final BookingBloc _bloc;
  bool visible = true;
  final _formKey = GlobalKey<FormState>();

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text('Бронирование'),
        elevation: 0,
      ),
      body: BlocBuilder<BookingBloc, BookingState>(
        bloc: _bloc,
        builder: (context, state) {
          return switch (state) {
            BookingDataState() => GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: Column(
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
                                  info:
                                      '${state.booking?.numberOfNights} ночей',
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
                            child: Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Информация о покупателе',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomTextField(
                                    label: 'Номер телефона',
                                    formatters: [
                                      MaskTextInputFormatter(
                                        mask: '+7 (###) ###-##-##',
                                        filter: {"#": RegExp(r'[0-9]')},
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomTextField(
                                    label: 'Почта',
                                    validator: validateEmail,
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
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          WhiteIsland(
                            padding: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Первый турист',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            visible = !visible;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: const Color.fromRGBO(
                                              13, 114, 255, 0.1),
                                          foregroundColor: const Color.fromRGBO(
                                              13, 114, 255, 1),
                                          shadowColor: Colors.transparent,
                                        ),
                                        child: Icon(visible == true
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down)),
                                  ],
                                ),
                                Form(
                                  key: _formKey,
                                  child: Visibility(
                                      visible: visible,
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            label: 'Имя',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Заполните это поле!';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            label: 'Фамилия',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Заполните это поле!';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            label: 'Дата рождения',
                                            formatters: [
                                              MaskTextInputFormatter(
                                                mask: '##.##.####',
                                                filter: {"#": RegExp(r'[0-9]')},
                                              ),
                                            ],
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Заполните это поле!';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            label: 'Гражданство',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Заполните это поле!';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            label: 'Номер загранпаспорта',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Заполните это поле!';
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          CustomTextField(
                                            label:
                                                'Срок действия загранпаспорта',
                                            formatters: [
                                              MaskTextInputFormatter(
                                                mask: '##.##.####',
                                                filter: {"#": RegExp(r'[0-9]')},
                                              ),
                                            ],
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Заполните это поле!';
                                              }
                                              return null;
                                            },
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          WhiteIsland(
                            padding: 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Добавить туриста',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          const Color.fromRGBO(13, 114, 255, 1),
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: const Icon(Icons.add)),
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
                          ),
                        ],
                      ),
                    ),
                    BottomNavigationButton(
                      label:
                          'Оплатить ${(state.booking?.serviceCharge ?? 0) + (state.booking?.fuelCharge ?? 0) + (state.booking?.tourPrice ?? 0)} ₽',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.push('/paid');
                        }
                      },
                    ),
                  ],
                ),
              ),
            BookingLoadingState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            BookingErrorState() => Center(
                child: Text(state.message ?? ''),
              ),
          };
        },
      ),
    );
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Почта введена некорректно'
        : null;
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    this.formatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      inputFormatters: formatters,
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
