import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';

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
          _searchBar(),
          const SizedBox(height: 20),
          _categoryButtons(),
          const SizedBox(height: 12),
          _adBanner(),
          const SizedBox(height: 20),
          _sectionTitle('Today ads'),
          _horizontalAds(['For rent', 'New'], ['For rent']),
          const SizedBox(height: 20),
          _sectionTitle('Service Providers'),
          _horizontalServices(),
          const SizedBox(height: 20),
          _sectionTitle('Wanted'),
          _wantedCard(),
          const SizedBox(height: 20),
          _sectionTitle('Most Viewed Ads'),
          _horizontalAds(['For sale'], ['For sale']),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(title.tr(), style: Theme.of(context).textTheme.titleLarge);
  }

  Widget _categoryButtons() {
    return Column(
      children: categoryTitles.map((row) {
        return Row(
          children: row.map((title) {
            final isSelected = selectedCategory == title;
            return Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: () => setState(() => selectedCategory = title),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isSelected ? AppColors.blue : AppColors.gray,
                    foregroundColor: isSelected ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(title.tr(), textAlign: TextAlign.center),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _searchBar() {
    return TextField(
      onTap: () {},
      decoration: InputDecoration(
        hintText: 'Find...'.tr(),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _adBanner() {
    return Container(
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
                      fontSize: 18, fontWeight: FontWeight.bold))),
          const Icon(Icons.phone_android, size: 40),
        ],
      ),
    );
  }

  Widget _horizontalAds(List<String> ad1, List<String> ad2) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _adCard(ad1),
          _adCard(ad2),
        ],
      ),
    );
  }

  Widget _adCard(List<String> labels) {
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
          if (labels.isNotEmpty)
            Positioned(top: 8, left: 8, child: _label(labels[0])),
          if (labels.length > 1)
            Positioned(
                top: 8,
                right: 8,
                child: _label(labels[1], color: AppColors.red)),
        ],
      ),
    );
  }

  Widget _label(String text, {Color color = AppColors.blue}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
      child: Text(text.tr(), style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _horizontalServices() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
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
                Text('مزود خدمة ${index + 1}'.tr(),
                    textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _wantedCard() {
    const title = 'Wanted for Rent Property in Damascus';
    const budget = '600';
    const region = 'Damascus, Al-Mujtahid';

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
          Text(title.tr(), style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('Budget: $budget billion s.p'.tr()),
          Text('Region: $region'.tr()),
        ],
      ),
    );
  }
}
