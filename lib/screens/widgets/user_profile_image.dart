import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/colors.dart';
import '../../database/user_local_data.dart';

class UserProfileImage extends StatelessWidget {
  final double radius;
  const UserProfileImage({
    this.radius = 26,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (UserLocalData?.getImageURL() != null &&
            UserLocalData?.getImageURL() != '')
        ? CircleAvatar(
            radius: radius,
            backgroundColor: Theme.of(context).primaryColorDark,
            child: CircleAvatar(
              radius: radius - 2,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: CircleAvatar(
                radius: radius - 6,
                backgroundImage: NetworkImage(UserLocalData.getImageURL()),
              ),
            ),
          )
        : Icon(
            FontAwesomeIcons.userCircle,
            color: orangeColor,
            size: radius,
          );
  }
}
