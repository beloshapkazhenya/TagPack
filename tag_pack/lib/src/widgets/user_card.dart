import 'package:flutter/material.dart';
import 'package:tag_pack/src/model/UserModel.dart';

class UserCard extends StatelessWidget {
  UserModel userData;

  UserCard({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: AssetImage(userData.avatarPath), fit: BoxFit.cover)),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 12)),
        Text(
          userData.name,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8)),
        Text(
          userData.email,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        )
      ],
    );
  }
}
