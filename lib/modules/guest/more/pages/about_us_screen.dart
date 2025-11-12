import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/widgets/text_required.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/custom_drop_down.dart';
import '../../../../widgets/small_icon_button.dart';
import '../../../my_tasks/presentation/widgets/filter.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final stats = [
    { "value": "+ 425", "label": "Teamwork" },
    { "value": "+ 40", "label": "Diverse services" },
    { "value": "+ 1,450", "label": "Master's & Ph.D. thesis" },
    { "value": "+ 10,605", "label": "Beneficiary" },
  ];

  List<String> socialIcons = [
    AppIcons.facebook,
    AppIcons.linkedin,
    AppIcons.youtube,
    AppIcons.instagram,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'About Us',
        onBackPress: ()=> AppNavigation.goBack(),
        rightIcon: Image.asset(AppImagePath.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Who are we', fontWeight: FontWeight.w700, size: 15.sp,),
            AppText('A specialized institution in providing educational and consulting services since 2018. We offer professional educational services and innovative solutions that meet the needs of students and support researchers in various academic and scientific fields, based on the best accredited standards.', size: 15.sp, color: AppCustomColors.appTextColor, align: TextAlign.start,),
            AppText('The institution is registered and licensed in several Arab Gulf countries.', size: 15.sp, align: TextAlign.start, color: AppCustomColors.appTextColor,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  final item = stats[index];
                  return statsCard(
                    value: item["value"]!,
                    label: item["label"]!,
                  );
                },
              ),
            ),

            AppText('Our Mission', fontWeight: FontWeight.w700, size: 15.sp,),
            AppText('To provide high-quality educational and research services that support students and researchers in achieving their academic and professional goals with minimal time and effort, ensuring a flexible educational experience while adhering to ethical and academic standards.', size: 15.sp, color: AppCustomColors.appTextColor, align: TextAlign.start,),

            AppText('Find Us', fontWeight: FontWeight.w700, size: 15.sp,).paddingSymmetric(vertical: 8.h),
            Row(
              children: [
                ...List.generate(
                  4,
                      (index) {
                    return SmallIconButton(
                      icon: socialIcons[index],
                      // color: AppCustomColors.blueColor,
                      color: AppCustomColors.blueColor,
                      // iconColor: Theme.of(context).textTheme.bodyMedium!.color!,
                      onTap: () {},
                    ).paddingOnly(left: 12.w);
                  },
                ),
              ],
            ),
            30.heightBox,
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }

  Widget statsCard(
      {required String value, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: AppCustomColors.colorGrey15,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
              color: AppCustomColors.appPrimaryColor,
            ),
          ),
          6.heightBox,
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
