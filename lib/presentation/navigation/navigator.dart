import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/notifications/views/notifications_drawer.dart';
import 'package:easyrent/presentation/views/property_homepage/views/homePage.dart';
import 'package:easyrent/presentation/views/profile/view/profile.dart';
import 'package:easyrent/presentation/views/search/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenNavigator extends StatefulWidget {
  const HomeScreenNavigator({super.key});

  @override
  State<HomeScreenNavigator> createState() => _HomeScreenNavigatorState();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}

class _HomeScreenNavigatorState extends State<HomeScreenNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Search(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ThemeSwitchingArea(
        child: Scaffold(
          key: HomeScreenNavigator.scaffoldKey,
          endDrawer: const NotificationsView(),
          body: _pages[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1.5.r,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              selectedLabelStyle: AppTextStyles.h12medium,
              unselectedLabelStyle: AppTextStyles.h12medium,
              selectedItemColor: primaryBlue,
              unselectedItemColor: grey,
              iconSize: 30.r, //!
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                    // TODO cant put transilations here
                    activeIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.search),
                    icon: Icon(Icons.search),
                    label: 'Search'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person),
                    icon: Icon(Icons.person_outline),
                    label: 'Profile'),
              ],
              elevation: 2,
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }
}
