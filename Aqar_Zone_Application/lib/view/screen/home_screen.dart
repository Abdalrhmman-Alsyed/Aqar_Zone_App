import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/static/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _selectedIndex = index),
          children: const [
            HomeTab(),
            Center(child: Text('Properties')),
            Center(child: Text('Add Post')),
            Center(child: Text('Cars')),
            Center(child: Text('Wanted')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: 'Properties'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Add Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'Cars'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Wanted'),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Properties market';

  final List<List<String>> categoryTitles = [
    ['Properties market', 'Cars market'],
    ['Properties brokers', 'Cars brokers'],
    ['Properties services', 'Cars services'],
    ['Properties projects'],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildSearchBar(),
          const SizedBox(height: 20),
          // _buildCategoryTabs(),
          const SizedBox(height: 12),
          _buildCategoryButtons(),
          const SizedBox(height: 12),
          _buildAdBanner(),
          const SizedBox(height: 20),
          Text('Today ads'.tr(), style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          _buildTodayAds(),
          const SizedBox(height: 20),
          Text('Service Providers'.tr(),
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          _buildServiceProviders(),
          const SizedBox(height: 20),
          Text('Wanted'.tr(), style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          _buildWantedSection(),
          const SizedBox(height: 20),
          Text('Most Viewed Ads'.tr(),
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          _buildMostViewedAds(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() => TextField(
        decoration: InputDecoration(
          hintText: 'Find...'.tr(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );

  Widget _animatedTab(String title, bool isSelected) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : AppColors.gray,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Column(
      children: categoryTitles.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: row.map((title) {
              final isSelected = selectedCategory == title;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => selectedCategory = title);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isSelected ? AppColors.blue : AppColors.gray,
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(title.tr(), textAlign: TextAlign.center),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAdBanner() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text('أكثر من 70 إعلان يومياً'.tr(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const Icon(Icons.phone_android, size: 40),
          ],
        ),
      );

  Widget _buildTodayAds() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAdCard('For rent'.tr(), 'New'.tr()),
          _buildAdCard('For rent'.tr()),
        ],
      ),
    );
  }

  Widget _buildAdCard(String label1, [String? label2]) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/sample.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: 8, left: 8, child: _label(label1)),
          if (label2 != null)
            Positioned(
                top: 8, right: 8, child: _label(label2, color: AppColors.red)),
        ],
      ),
    );
  }

  Widget _label(String text, {Color color = AppColors.blue}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildServiceProviders() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: 100,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const Icon(Icons.home_outlined),
              const SizedBox(height: 6),
              Text('مزود خدمة \${index + 1}'.tr(), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWantedSection() {
    return Column(
      children: [
        _wantedCard(
          title: 'Wanted for Rent Property in Damascus'.tr(),
          budget: '600',
          region: 'Damascus, Al-Mujtahid',
        ),
      ],
    );
  }

  Widget _wantedCard(
      {required String title, required String budget, required String region}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Budget: \$budget billion s.p'.tr()),
          Text('Region: \$region'.tr()),
        ],
      ),
    );
  }

  Widget _buildMostViewedAds() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAdCard('For sale'.tr()),
          _buildAdCard('For sale'.tr()),
        ],
      ),
    );
  }
}
