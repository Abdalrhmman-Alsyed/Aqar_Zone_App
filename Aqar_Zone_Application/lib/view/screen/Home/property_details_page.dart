import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/static/app_colors.dart';

class PropertyDetailsPage extends StatelessWidget {
  const PropertyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
        backgroundColor: AppColors.blue,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: AppColors.gray,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Icons.share,
                color: AppColors.gray,
              ),
              onPressed: () {
                Clipboard.setData(
                    const ClipboardData(text: "https://example.com/property"));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: AppColors.green,
                      content: Text('Link copied to clipboard'.tr())),
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('images/AqarZoneBlue1.png', fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),

            // Title & Price
            const Text('Apartment 120 m²',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Damascus - Najmeh Square',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('10,000 USD / Yearly',
                style: TextStyle(fontSize: 18, color: AppColors.gold)),

            const Divider(height: 32),

            // Description
            const Text(
              'غرفتين وصالون، مطبخ، حمام، مع بلكون.\n'
              'قريب من جميع الخدمات لسهولة الوصول دون الحاجة إلى التنقل لمسافات طويلة.\n'
              'حياة اجتماعية نشطة ومواصلات مرنة.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),

            const Divider(height: 32),

            // Property characteristics
            const Text('Property Characteristics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              runSpacing: 12,
              spacing: 20,
              children: const [
                PropertyItem(label: 'Area', value: '120 m²'),
                PropertyItem(label: 'Rooms', value: '2'),
                PropertyItem(label: 'Furnished', value: 'Yes'),
                PropertyItem(label: 'Direction', value: 'South-East'),
                PropertyItem(label: 'Floor', value: '2'),
                PropertyItem(label: 'Condition', value: 'Good'),
                PropertyItem(label: 'Rental Duration', value: 'Yearly'),
                PropertyItem(label: 'Lessor', value: 'Owner'),
              ],
            ),

            const SizedBox(height: 24),

            // Extra Features
            const Text('Extra Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: const [
                Chip(label: Text('Balcony')),
                Chip(label: Text('Elevator')),
              ],
            ),

            const SizedBox(height: 24),

            // Keywords
            const Text('Keywords',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: const [
                Chip(
                  label: Text('Serviced area'),
                ),
                Chip(label: Text('Prime location')),
                Chip(label: Text('Quality interior')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyItem extends StatelessWidget {
  final String label;
  final String value;

  const PropertyItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.blue, size: 18),
          const SizedBox(width: 6),
          Expanded(
              child:
                  Text('$label: $value', style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
