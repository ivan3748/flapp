import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movie/features/home/presentation/widgets/home_content_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _currentIndex = 0;

  // Define different views for each tab
  final List<Widget> _views = [
    const HomeContentView(), // Main content for "Home" tab
    const SizedBox(), // Replace this with actual widget for "Tickets" tab
    const SizedBox(), // Replace this with actual widget for "Bookmarks" tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bookmark.svg',
              height: 25.h,
              width: 25.h,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bookmark-1.svg',
              height: 25,
              width: 25,
            ),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/bookmark-2.svg',
              height: 25.h,
              width: 25.h,
            ),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}
