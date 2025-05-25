import 'package:aqar_zone_application/view/screen/Home/property_details_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/static/app_colors.dart';

class PropertiesPage extends StatelessWidget {
  PropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Properties'),
        actions: [
          IconButton(icon: Icon(Icons.video_call), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _searchBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                PropertyCard(
                  imageUrl: 'images/AqarZoneBlue1.png',
                  label: 'For rent',
                  isFavorite: true,
                  title: 'Apartment 120 m²',
                  location: 'Damascus - Najmeh Square',
                  price: '10 thousand USD / Yearly',
                  time: '19 hours ago',
                  views: 289,
                  ontap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PropertyDetailsPage(),
                    ));
                  },
                ),
                SizedBox(height: 12),
                PropertyCard(
                  imageUrl: 'images/AqarZoneBlue1.png',
                  label: 'For sale',
                  isFavorite: true,
                  title: 'Apartment 169 m²',
                  location: 'Damascus - Western Mazzeh',
                  price: '30 thousand USD',
                  time: 'a day ago',
                  views: 298,
                  ontap: () {},
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
      padding: EdgeInsets.all(15.0),
      child: TextField(
        onTap: () {},
        decoration: InputDecoration(
          hintText: 'Find...'.tr(),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home),
          Icon(Icons.apartment),
          SizedBox(width: 48), // space for FAB
          Icon(Icons.directions_car),
          Icon(Icons.assignment_turned_in),
        ],
      ),
    );
  }
}

// Dont forget change the Url of image from asset to netWork

class PropertyCard extends StatefulWidget {
  final String imageUrl;
  final String label;
  final bool isFavorite;
  final String title;
  final String location;
  final String price;
  final String time;
  final int views;
  final VoidCallback ontap;

  PropertyCard({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.isFavorite,
    required this.title,
    required this.location,
    required this.price,
    required this.time,
    required this.views,
    required this.ontap,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Card(
        color: AppColors.gray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(widget.imageUrl,
                      height: 160, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: [
                      _buildTag(widget.label, Colors.teal),
                      SizedBox(width: 6),
                      if (widget.isFavorite) _buildTag('New', Colors.red),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Column(
                    children: [
                      _buildIconButton(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        isFavorite ? AppColors.red : AppColors.white,
                      ),
                      SizedBox(height: 12),
                      _buildIconButton(Icons.share, () {
                        Clipboard.setData(const ClipboardData(
                            text: "https://example.com/property"));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: AppColors.green,
                              content: Text('Link copied to clipboard'.tr())),
                        );
                      }, AppColors.white),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      SizedBox(width: 4),
                      Text(widget.location),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(widget.price, style: TextStyle(color: Colors.teal)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(widget.time),
                      Spacer(),
                      Icon(Icons.visibility, size: 18, color: AppColors.gray),
                      SizedBox(width: 4),
                      Text('${widget.views}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 22),
        onPressed: onPressed,
        padding: EdgeInsets.all(8),
        constraints: BoxConstraints(),
      ),
    );
  }
}
