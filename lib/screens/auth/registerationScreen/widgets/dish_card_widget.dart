import 'package:flutter/material.dart';
import 'package:up2us/models/register_menu.dart';

class DishCardWidget extends StatelessWidget {
  final RegisterMenu menu;
  const DishCardWidget({@required this.menu});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          // decoration: const BoxDecoration(color: Colors.yellow),
          margin: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(menu.imageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: MediaQuery.of(context).size.width / 5,
          right: MediaQuery.of(context).size.width / 5,
          child: Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColorDark.withOpacity(0.8),
                Theme.of(context).accentColor.withOpacity(1),
                Theme.of(context).primaryColorDark.withOpacity(0.8),
              ]),
            ),
            child: Center(
                child: Text(
              menu.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )),
          ),
        ),
        const Positioned(
            top: 6,
            right: 20,
            child: CircleAvatar(
              radius: 20,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
              ),
            ))
      ],
    );
  }
}
