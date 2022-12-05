import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';

class JoinSocialMedia extends StatelessWidget {
  Function(SocialMedia media) joinSocialMediaAction;

  JoinSocialMedia({Key? key, required this.joinSocialMediaAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          Strings.join_on_social_media,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => joinSocialMediaAction(SocialMedia.facebook),
                icon: const Image(
                  image: AssetImage(Assets.social_facebook),
                )),
            const Padding(padding: EdgeInsets.only(left: 30)),
            IconButton(
                onPressed: () => joinSocialMediaAction(SocialMedia.instagram),
                icon: const Image(
                  image: AssetImage(Assets.social_instagram),
                )),
            const Padding(padding: EdgeInsets.only(left: 30)),
            IconButton(
                onPressed: () => joinSocialMediaAction(SocialMedia.twitter),
                icon: const Image(
                  image: AssetImage(Assets.social_twitter),
                )),
          ],
        )
      ],
    );
  }
}
