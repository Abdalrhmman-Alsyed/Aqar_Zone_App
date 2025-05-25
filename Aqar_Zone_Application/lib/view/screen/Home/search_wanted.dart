import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widget/wanted_card.dart';

class WantedPage extends StatelessWidget {
  const WantedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wanted'),
        actions: [
          IconButton(icon: const Icon(Icons.video_call), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _searchBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                WantedCard(
                  title: 'Wanted for Buy Property in Damascus',
                  budget: 400,
                  region: 'Damascus, Mashrou Dummar',
                  description:
                      'تراس ب مشروع دمر\nمدخل مباشر مع كراج ، و على العظم ( دون إكساء )',
                  postedTime: '17 hours ago',
                ),
                SizedBox(height: 12),
                WantedCard(
                  title: 'Wanted for Rent Property in Damascus',
                  budget: 0.35,
                  region: 'Damascus, Eastern Mazzeh',
                  description:
                      'مطلوب بيت للاجار بالمزة مابي بال86\n٣ غرف وصالون\nمعضمية دوار العلم او مزة',
                  postedTime: 'a day ago',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        onTap: () {},
        decoration: InputDecoration(
          hintText: 'Find...'.tr(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
