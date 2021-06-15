import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../edit_profile_view.dart';

class ProfileListButton extends StatelessWidget {
  final String text;
  final String routeName;
  final User user;
  const ProfileListButton({Key key, this.text, this.routeName, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(EditProfileScreen.routeName, arguments: {'user': user});
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
        color: Colors.white,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            Expanded(child: Container()),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
