import 'package:flutter/material.dart';
import 'package:up2us/config/colors.dart';
import '../../../../models/register_menu.dart';

class DishCardWidget extends StatefulWidget {
  final RegisterMenu menu;
  const DishCardWidget({@required this.menu});
  @override
  _DishCardWidgetState createState() => _DishCardWidgetState();
}

class _DishCardWidgetState extends State<DishCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          // margin: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(widget.menu?.imageURL),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Theme.of(context).primaryColorDark,
                Theme.of(context).accentColor,
                Theme.of(context).primaryColorDark,
              ]),
            ),
            child: Center(
                child: Text(
              widget.menu?.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )),
          ),
        ),
        Positioned(
          top: 6,
          right: 20,
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.menu.isSelected = !widget.menu.isSelected;
              });
            },
            child: CircleAvatar(
              radius: 20,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: (widget.menu.isSelected)
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
