import 'package:flutter/material.dart';

class WantedCard extends StatelessWidget {
  final String title;
  final double budget;
  final String region;
  final String description;
  final String postedTime;

  const WantedCard({
    super.key,
    required this.title,
    required this.budget,
    required this.region,
    required this.description,
    required this.postedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.monetization_on_outlined, size: 18),
                const SizedBox(width: 4),
                Text('Budget ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[600])),
                Text('$budget thousand USD',
                    style: const TextStyle(color: Colors.teal)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18),
                const SizedBox(width: 4),
                Text('Region ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[600])),
                Text(region,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.start),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.access_time_outlined, size: 18),
                const SizedBox(width: 4),
                Text(postedTime),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone, size: 18),
                  label: const Text('Contact'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
