import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/model/Enums.dart';

getPageRouterWithVerticalTransition(Widget targetPage,
    {int animationDuration = 700}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => targetPage,
      transitionDuration: Duration(milliseconds: animationDuration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

getPageRouterWithHorizontalTransition(Widget targetPage,
    {int animationDuration = 700}) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => targetPage,
      transitionDuration: Duration(milliseconds: animationDuration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

getPageRouterWithCustomOffsetTransition(
    Widget targetPage, double bx, double by, double ex, double ey) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => targetPage,
      transitionDuration: const Duration(milliseconds: 700),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = Offset(bx, by);
        Offset end = Offset(ex, ey);
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      });
}

class ScrollBehaviorWithoutGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

String getFabricTitleByType(FabricType fabricType) {
  switch (fabricType) {
    case FabricType.t_shirt:
      return Strings.t_shirt;
    case FabricType.trousers:
      return Strings.trousers;
    case FabricType.jeans:
      return Strings.jeans;
    case FabricType.blouse:
      return Strings.blouse;
    case FabricType.sweater:
      return Strings.sweater;
    case FabricType.skin:
      return Strings.skin;
  }
}

String getFabricImagePathByType(FabricType type) {
  switch (type) {
    case FabricType.t_shirt:
      return Assets.t_shirt;
    case FabricType.trousers:
      return Assets.trousers;
    case FabricType.jeans:
      return Assets.jeans;
    case FabricType.blouse:
      return Assets.blouse;
    case FabricType.sweater:
      return Assets.sweater;
    case FabricType.skin:
      return Assets.sweater;
  }
}

String getStainTitleByType(StainType type) {
  switch (type) {
    case StainType.wine:
      return Strings.wine;
    case StainType.chocolate:
      return Strings.chocolate;
    case StainType.blood:
      return Strings.blood;
    case StainType.berries:
      return Strings.berries;
    case StainType.oil:
      return Strings.oil;
    case StainType.beer:
      return Strings.beer;
    case StainType.cosmetic:
      return Strings.cosmetic;
    case StainType.coffee:
      return Strings.coffee;
    case StainType.tomato:
      return Strings.tomato;
    case StainType.milk:
      return Strings.milk;
    case StainType.grass:
      return Strings.grass;
    case StainType.unknown:
      return Strings.unknown;
  }
}

String getStainImagePathByType(StainType type) {
  switch (type) {
    case StainType.wine:
      return Assets.wine;
    case StainType.chocolate:
      return Assets.chocolate;
    case StainType.blood:
      return Assets.blood;
    case StainType.berries:
      return Assets.berries;
    case StainType.oil:
      return Assets.oil;
    case StainType.beer:
      return Assets.beer;
    case StainType.cosmetic:
      return Assets.cosmetic;
    case StainType.coffee:
      return Assets.coffee;
    case StainType.tomato:
      return Assets.tomato;
    case StainType.milk:
      return Assets.milk;
    case StainType.grass:
      return Assets.grass;
    case StainType.unknown:
      return Assets.unknown;
  }
}

class CenterHolePath extends CustomClipper<Path> {
  final double holeWidth;
  final double holeHeight;

  CenterHolePath({
    required this.holeWidth,
    required this.holeHeight,
  });

  @override
  Path getClip(Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(size.width / 2, size.height / 2 - 14),
                width: holeWidth,
                height: holeHeight),
            const Radius.circular(12)),
      )
      ..addRect(rect);

    return path;
  }

  @override
  bool shouldReclip(covariant CenterHolePath oldClipper) {
    return holeWidth != oldClipper.holeWidth ||
        holeHeight != oldClipper.holeHeight;
  }
}
