import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        foregroundColor: Colors.white,
        leading: BackButton(),
        title: Text("contact_us".tr()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'contact_us_description'.tr(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Card(
              color: AppColors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.phone, color: AppColors.white),
                title: Text('phone'.tr(),
                    style: TextStyle(color: AppColors.white)),
                subtitle:
                    Text('0934178614', style: TextStyle(color: AppColors.gray)),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: AppColors.gold,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.email, color: AppColors.white),
                title: Text('email'.tr(),
                    style: TextStyle(color: AppColors.white)),
                subtitle: Text('AqarZone.com',
                    style: TextStyle(color: AppColors.gray)),
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.access_time, color: AppColors.white),
                title: Text('work_hours'.tr(),
                    style: TextStyle(color: AppColors.white)),
                subtitle: Text('work_hours_details'.tr(),
                    style: TextStyle(color: AppColors.gray)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
