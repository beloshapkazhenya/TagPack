import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';
import 'package:tag_pack/src/model/UserModel.dart';
import 'package:tag_pack/src/repository/repository.dart';
import 'package:tag_pack/src/widgets/join_social_media.dart';
import 'package:tag_pack/src/widgets/settings_menu_item.dart';
import 'package:tag_pack/src/widgets/user_card.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  UserModel user = DataRepository().getUserData();

  final List<String> _menuItems = [
    Strings.subscription,
    Strings.help,
    Strings.information,
    Strings.privacy,
    Strings.terms,
    Strings.logout
  ];

  void joinSocialMedia(SocialMedia media) {
    print('clicked: $media');
  }

  Widget _createUserCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 26),
      child: UserCard(userData: user),
    );
  }

  Widget _createMenu() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return SettingsMenuItem(title: _menuItems[index], itemAction: () => {});
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemCount: _menuItems.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  Widget _createSocialMediaField() {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: JoinSocialMedia(
          joinSocialMediaAction: (media) => joinSocialMedia(media)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            Strings.setting,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration:
                    const BoxDecoration(color: AppColors.backgroundColor),
              ),
              Column(
                children: [
                  _createUserCard(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _createMenu(),
                  ),
                  _createSocialMediaField(),
                ],
              )
            ],
          ),
        ));
  }
}
