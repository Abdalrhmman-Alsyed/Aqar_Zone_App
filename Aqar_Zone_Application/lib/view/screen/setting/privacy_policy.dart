import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        leading: BackButton(),
        title: Text("privacy_policy".tr()),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: PrivacyContent(),
      ),
    );
  }
}

class PrivacyContent extends StatelessWidget {
  const PrivacyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PolicySection(
          title: 'privacy_1_title'.tr(),
          content: 'privacy_1_content'.tr(),
        ),
        SizedBox(height: 20),
        PolicySection(
          title: 'privacy_2_title'.tr(),
          content: 'privacy_2_content'.tr(),
        ),
        SizedBox(height: 20),
        PolicySection(
          title: 'privacy_3_title'.tr(),
          content: 'privacy_3_content'.tr(),
        ),
        SizedBox(height: 20),
        PolicySection(
          title: 'privacy_4_title'.tr(),
          content: 'privacy_4_content'.tr(),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PolicySection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 14, height: 1.6),
        ),
      ],
    );
  }
}
