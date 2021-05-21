import 'package:flutter/material.dart';
import 'package:up2us/database/user_local_data.dart';
import 'package:up2us/screens/widgets/user_profile_image.dart';

class AppEndDrawer extends StatelessWidget {
  const AppEndDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 60),
          _showUserImageWithNotifications(),
          const SizedBox(height: 8),
          Text(
            UserLocalData.getDisplayName(),
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShowSheetTitleOfEndDrawer(
                  icon: Icons.history,
                  colors: Colors.indigo,
                  title: 'History',
                ),
                ShowSheetTitleOfEndDrawer(
                  icon: Icons.comment,
                  colors: Colors.orange,
                  title: 'Reviews',
                ),
                ShowSheetTitleOfEndDrawer(
                  icon: Icons.star_rate,
                  colors: Colors.orange,
                  title: 'Favorite',
                ),
                ShowSheetTitleOfEndDrawer(
                  icon: Icons.favorite,
                  colors: Colors.red,
                  title: 'Saved',
                ),
                ShowSheetTitleOfEndDrawer(
                  icon: Icons.ac_unit,
                  colors: Colors.black,
                  title: 'Blocklist',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack _showUserImageWithNotifications() {
    return Stack(
      children: const [
        SizedBox(
          height: 82,
          width: 82,
          child: UserProfileImage(radius: 40),
        ),
        Positioned(
          right: 6,
          child: CircleAvatar(
            radius: 10,
            child: Text('14'),
          ),
        )
      ],
    );
  }
}

class ShowSheetTitleOfEndDrawer extends StatelessWidget {
  final IconData icon;
  final Color colors;
  final String title;
  const ShowSheetTitleOfEndDrawer({
    @required this.icon,
    @required this.colors,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Row(
        children: [
          Icon(icon, color: colors, size: 20),
          const SizedBox(width: 8),
          Text(title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
