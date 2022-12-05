import 'package:flutter/material.dart';
import 'package:tag_pack/src/constants/AppColors.dart';
import 'package:tag_pack/src/constants/assets.dart';
import 'package:tag_pack/src/constants/strings.dart';
import 'package:tag_pack/src/screens/home/home.dart';
import 'package:tag_pack/src/screens/saved/saved.dart';
import 'package:tag_pack/src/screens/scan/scan.dart';
import 'package:tag_pack/src/screens/settings/settings.dart';
import 'package:tag_pack/src/screens/wash/wash.dart';
import 'package:tag_pack/src/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;

  final List<Widget> _screens = <Widget>[
    const Home(),
    const Saved(),
    const Scan(),
    const Wash(),
    const Settings()
  ];

  void changeActivePage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void goToScanPage(BuildContext context) {
    Navigator.of(context).push(getPageRouterWithVerticalTransition(const Scan(),
        animationDuration: 300));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(child: _screens.elementAt(_currentPageIndex)),
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Container(
          height: 76,
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.beige,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(_currentPageIndex == 0
                        ? Assets.ic_nav_home_active
                        : Assets.ic_nav_home_inactive),
                    gaplessPlayback: true,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  const Text(Strings.home,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorDark))
                ],
              ),
              onTap: () => changeActivePage(0),
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(_currentPageIndex == 1
                        ? Assets.ic_nav_saved_active
                        : Assets.ic_nav_saved_inactive),
                    gaplessPlayback: true,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  const Text(Strings.saved,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorDark))
                ],
              ),
              onTap: () => changeActivePage(1),
            ),
            SizedBox(
              width: 70,
              height: 70,
              child: InkWell(
                child: ClipOval(
                  child: Material(
                    color: AppColors.colorDark,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.fullscreen,
                          color: AppColors.backgroundColor,
                        ),
                        // Image(image: AssetImage('assets/ic_nav_scan.png')),
                        Padding(padding: EdgeInsets.only(bottom: 8)),
                        Text(Strings.scan,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.backgroundColor))
                      ],
                    ),
                  ),
                ),
                onTap: () => goToScanPage(context),
              ),
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(_currentPageIndex == 3
                        ? Assets.ic_nav_wash_active
                        : Assets.ic_nav_wash_inactive),
                    gaplessPlayback: true,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  const Text(Strings.wash,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorDark))
                ],
              ),
              onTap: () => changeActivePage(3),
            ),
            InkWell(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(_currentPageIndex == 4
                        ? Assets.ic_nav_settings_active
                        : Assets.ic_nav_settings_inactive),
                    gaplessPlayback: true,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 8)),
                  const Text(Strings.setting,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorDark))
                ],
              ),
              onTap: () => changeActivePage(4),
            ),
          ])),
    );
  }
}
