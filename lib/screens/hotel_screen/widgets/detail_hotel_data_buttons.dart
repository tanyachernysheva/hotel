import 'package:flutter/material.dart';

class DetailHotelDataButtons extends StatelessWidget {
  const DetailHotelDataButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(251, 251, 252, 1),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.emoji_emotions_outlined),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Удобства'),
                        subtitle: Text(
                          'Самое необходимое',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 135, 150, 1),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(44, 48, 53, 1),
                        ),
                      ),
                      Divider(
                        height: 0,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_box_outlined),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Что включено'),
                        subtitle: Text(
                          'Самое необходимое',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 135, 150, 1),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(44, 48, 53, 1),
                        ),
                      ),
                      Divider(
                        height: 0,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.square_outlined),
                Expanded(
                  child: ListTile(
                    title: Text('Что не включено'),
                    subtitle: Text(
                      'Самое необходимое',
                      style: TextStyle(
                        color: Color.fromRGBO(130, 135, 150, 1),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(44, 48, 53, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
