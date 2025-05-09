import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/property_homepage/views/homePage.dart';
import 'package:easyrent/presentation/profile/view/profile.dart';
import 'package:easyrent/presentation/search/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenNavigator extends StatefulWidget {
  const HomeScreenNavigator({super.key});

  @override
  State<HomeScreenNavigator> createState() => _HomeScreenNavigatorState();
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
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: lightPrimary,
                width: 1.0,
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
    );
  }
}
