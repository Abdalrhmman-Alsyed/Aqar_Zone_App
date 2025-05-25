import 'package:aqar_zone_application/view/screen/Home/search_wanted.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/static/app_colors.dart';
import 'Home/home_tap.dart';
import 'Home/properties_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  final List<IconData> _icons = [
    Icons.home,
    Icons.location_city,
    Icons.add_circle_outline,
    Icons.directions_car,
    Icons.search,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        foregroundColor: Colors.white,
        title: Text("aqar_zone".tr()),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _selectedIndex = index),
          children: [
            HomeTab(),
            PropertiesPage(),
            Center(child: Text('Add Post')),
            Center(child: Text('Cars')),
            WantedPage(),
          ],
        ),
      ),
      bottomNavigationBar: _buildCustomBottomBar(),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          onPressed: () => _onItemTapped(2),
          backgroundColor: AppColors.blue,
          child: Icon(
            Icons.add,
            size: 30,
            color: AppColors.gold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCustomBottomBar() {
    final List<String> _labels = ['Home', 'Properties', '', 'Cars', 'Wanted'];

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      color: AppColors.gray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          if (index == 2) return const SizedBox(width: 50); // For FAB spacing

          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  size: 30,
                  _icons[index],
                  color: _selectedIndex == index
                      ? AppColors.blue
                      : Colors.grey.shade600,
                ),
                const SizedBox(height: 4),
                Text(
                  _labels[index].tr(),
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? AppColors.blue
                        : Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
