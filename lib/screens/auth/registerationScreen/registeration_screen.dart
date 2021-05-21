import 'package:flutter/material.dart';
import '../../../database/register_menu_firebase_methods.dart';
import '../../../database/user_local_data.dart';
import '../../../models/register_menu.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/app_end_drawer.dart';
import '../../widgets/user_profile_image.dart';
import 'widgets/dish_card_widget.dart';
import 'widgets/register_finish_button.dart';

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
    data.docs.forEach((docs) {
      menu.add(RegisterMenu.fromDocument(docs));
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
        actions: const [
          AppBarUserPhoto(),
          SizedBox(width: 14),
        ],
      ),
      drawer: const AppDrawer(),
      endDrawer: const AppEndDrawer(),
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
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: menu.length,
                    itemBuilder: (context, index) {
                      return DishCardWidget(
                        menu: menu[index],
                      );
                    },
                  ),
                  const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: RegisterFinishButton())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarUserPhoto extends StatelessWidget {
  const AppBarUserPhoto({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openEndDrawer();
      },
      child: const UserProfileImage(),
    );
  }
}
