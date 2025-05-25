import 'package:aqar_zone_application/view/screen/Auth/login_screen.dart';
import 'package:aqar_zone_application/view/screen/home_screen.dart';
import 'package:aqar_zone_application/view/screen/setting/change_language.dart';
import 'package:aqar_zone_application/view/screen/setting/contact_us.dart';
import 'package:aqar_zone_application/view/screen/setting/help.dart';
import 'package:aqar_zone_application/view/screen/setting/privacy_policy.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';

class SettingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aqar_zone".tr())),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.blue),
              child: Image.asset('images/AqarZoneBlue1.png'),
            ),
            _buildSectionTitle("My_Profile".tr()),
            _buildListItem(
                context, Icons.language, 'Language'.tr(), ChangeLanguage()),
            _buildListItem(
                context, Icons.attach_money, 'Currency'.tr(), HomeScreen()),
            _buildListItem(context, Icons.login, 'Login'.tr(), LoginScreen()),
            _buildSectionTitle("Support".tr()),
            _buildListItem(context, Icons.help_outline, 'Help'.tr(), Help()),
            _buildListItem(
                context, Icons.phone, 'Contact Us'.tr(), ContactUsPage()),
            _buildListItem(context, Icons.privacy_tip, 'Privacy Policy'.tr(),
                PrivacyPolicyPage()),
            Divider(),
            _buildListItem(
                context, Icons.business, 'My Favorites'.tr(), HomeScreen()),
            _buildListItem(context, Icons.build, 'Services'.tr(), HomeScreen()),
            _buildListItem(
                context, Icons.article_outlined, 'Blogs'.tr(), HomeScreen()),
            _buildListItem(
                context, Icons.share, 'Invite Friends'.tr(), HomeScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: AppColors.gray,
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
