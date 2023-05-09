import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gabha_app1/constant/AppColors.dart';

import '../home/AcitivtyHome.dart';
import '../home/ActivityHomeLists.dart';
import 'ActivityProfile.dart';
import 'ActivitySocialMedia.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AppColors appColors=AppColors();
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: appColors.hintHeadingColor.withOpacity(0.5), spreadRadius: 0, blurRadius: 10),
          ],
        ),

        child:ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (newIndex) => setState((){_selectedIndex = newIndex;}),
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svgs/home.svg",width: 25,height: 25,color: appColors.mainHeadingColor,
                  ),
                  icon: SvgPicture.asset(
                    "assets/svgs/home.svg",width: 25,height: 25,
                    color: appColors.subHeadingColor
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svgs/social_media.svg",width: 25,height: 25,color: appColors.mainHeadingColor,
                  ),
                  icon: SvgPicture.asset(
                      "assets/svgs/social_media.svg",width: 25,height: 25,
                      color: appColors.subHeadingColor
                  ),
                  label: "Social Media",
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/svgs/User.svg",width: 25,height: 25,color: appColors.mainHeadingColor,
                  ),
                  icon: SvgPicture.asset(
                      "assets/svgs/User.svg",width: 25,height: 25,
                      color: appColors.subHeadingColor
                  ),
                  label: "Profile",
                ),
              ],
             // type: BottomNavigationBarType.shifting,
              selectedItemColor:appColors.subHeadingColor,
              iconSize: 20,
              unselectedItemColor: appColors.subHeadingColor,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              elevation: 10,
          ),
        ),
      ),
      body:  IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          //ActivityHome(),
          ActivityHomeLists(),
          ActivitySocialMedia(),
          ActivityProfile(),
        ],
      ),
    );
  }
}