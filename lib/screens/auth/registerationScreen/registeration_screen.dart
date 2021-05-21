import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:up2us/config/colors.dart';
import 'package:up2us/database/register_menu_firebase_methods.dart';
import 'package:up2us/database/user_local_data.dart';
import 'package:up2us/models/register_menu.dart';
import 'widgets/dish_card_widget.dart';

class RegisterationScreen extends StatefulWidget {
  static const routeName = '/RegisterationScreen';
  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  List<RegisterMenu> menu = [];

  Future<void> _onPageLoad() async {
    final data = await RegisterMenuFirebaseMethods().getRegisterMenuItems();
    // ignore: avoid_function_literals_in_foreach_calls
    data.docs.forEach((element) {
      menu.add(
        RegisterMenu(
          title: element.data()['title'].toString(),
          imageURL: element.data()['imageURL'].toString(),
        ),
      );
    });
    setState(() {});
  }

  @override
  void initState() {
    _onPageLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 26,
        title: Text(
          'Hi, ${UserLocalData?.getDisplayName()}',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        centerTitle: false,
        actions: [
          // ignore: prefer_if_elements_to_conditional_expressions
          (UserLocalData.getImageURL() != null ||
                  UserLocalData.getImageURL() != '')
              ? CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(UserLocalData.getImageURL()),
                )
              : const Icon(FontAwesomeIcons.userCircle, color: orangeColor),
          const SizedBox(width: 14),
        ],
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.white70),
            const Text(
              'Register Here',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return DishCardWidget(menu: menu[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
