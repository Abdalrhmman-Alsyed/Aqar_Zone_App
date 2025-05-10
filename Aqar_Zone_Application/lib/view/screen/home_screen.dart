import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Cars',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Wanted',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 12),
            _buildCategoryTabs(),
            const SizedBox(height: 12),
            _buildCategoryButtons(),
            const SizedBox(height: 12),
            _buildAdBanner(),
            const SizedBox(height: 20),
            Text('Today ads'.tr(),
                style: Theme.of(context).textTheme.titleLarge),
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
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Find...'.tr(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Row(
      children: [
        _buildTabButton('Properties'.tr(), isSelected: true),
        const SizedBox(width: 8),
        _buildTabButton('Cars'.tr()),
      ],
    );
  }

  Widget _buildTabButton(String title, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey[200],
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
      children: [
        Row(
          children: [
            _buildCategoryButton('Properties market'.tr()),
            const SizedBox(width: 8),
            _buildCategoryButton('Cars market'.tr()),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildCategoryButton('Properties brokers'.tr()),
            const SizedBox(width: 8),
            _buildCategoryButton('Cars brokers'.tr()),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildCategoryButton('Properties services'.tr()),
            const SizedBox(width: 8),
            _buildCategoryButton('Cars services'.tr()),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildCategoryButton('Properties projects'.tr()),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryButton(String title) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(title, textAlign: TextAlign.center),
      ),
    );
  }

  Widget _buildAdBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orangeAccent,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'أكثر من 70 إعلان يومياً'.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(Icons.phone_android, size: 40),
        ],
      ),
    );
  }

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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage('assets/sample.jpg'), // ضع صورة مناسبة
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(top: 8, left: 8, child: _label(label1)),
          if (label2 != null)
            Positioned(
                top: 8, right: 8, child: _label(label2, color: Colors.red)),
        ],
      ),
    );
  }

  Widget _label(String text, {Color color = Colors.teal}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildServiceProviders() {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(3, (index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Icon(Icons.home_outlined),
                const SizedBox(height: 6),
                Text('مزود خدمة ${index + 1}'.tr(),
                    textAlign: TextAlign.center),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildWantedSection() {
    return Column(
      children: [
        _wantedCard(
            title: 'Wanted for Rent Property in Damascus'.tr(),
            budget: '600',
            region: 'Damascus, Al-Mujtahid'),
      ],
    );
  }

  Widget _wantedCard(
      {required String title, required String budget, required String region}) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Budget: $budget billion s.p'.tr()),
          Text('Region: $region'.tr()),
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
