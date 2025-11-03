import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/routes/navigation_services.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../../../../utils/theme/appColors.dart';
import '../../../../widgets/app_bar_bottom_sheet.dart';
import '../../../../widgets/app_button.dart';

void calenderBottomSheet(
    BuildContext context,
    Function(String) onCalenderSelected,
    String currentCalender,
    ) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      String selectedCalender = currentCalender;

      return StatefulBuilder(
        builder: (context, setState) {
          return AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              // padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBarBottomSheet(title: 'Calendar Display Style'.tr()),
                  const SizedBox(height: 12),

                  /// 🇴🇲 Arabic Option
                  _buildLanguageOption(
                    context: context,
                    title: "Weekly".tr(),
                    icon: AppImagePath.weeklyCalender,
                    isSelected: selectedCalender == "week",
                    onTap: () => setState(() => selectedCalender = "week"),
                  ),

                  /// 🇬🇧 English Option
                  _buildLanguageOption(
                    context: context,
                    title: "Monthly".tr(),
                    icon: AppImagePath.monthlyCalender,
                    isSelected: selectedCalender == "month",
                    onTap: () => setState(() => selectedCalender = "month"),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onTap: () {
                            AppNavigation.goBack();
                          },
                          title: 'cancel'.tr(),
                          height: 48.h,
                          color: AppCustomColors.colorLightBlue5,
                          textColor: AppCustomColors.blackColor,
                          fontWeight: FontWeight.w700,
                          isRounded: false,
                          borderColor: Colors.transparent,
                        ),
                      ),

                      8.widthBox,
                      Expanded(
                        child: AppButton(
                          onTap: () {
                            Navigator.pop(context);
                            onCalenderSelected(selectedCalender);
                          },
                          title: 'Apply'.tr(),
                          height: 48.h,
                          color: AppCustomColors.appPrimaryColor,
                          textColor: AppCustomColors.blackColor,
                          fontWeight: FontWeight.w700,
                          isRounded: false,
                        ),
                      ),

                    ],
                  ),

                  /// 🔘 Confirm Button
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       minimumSize: const Size.fromHeight(52),
                  //       backgroundColor: AppCustomColors.appPrimaryColor,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(16),
                  //       ),
                  //       elevation: 0,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //       onCalenderSelected(selectedCalender);
                  //     },
                  //     child: Text(
                  //       'changeLanguage'.tr(),
                  //       style: const TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w700,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  //
                  // const SizedBox(height: 28),
                ],
              ).paddingAll(20),
            ),
          );
        },
      );
    },
  );
}

Widget _buildLanguageOption({
  required BuildContext context,
  required String title,
  required String icon,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? AppCustomColors.appPrimaryColor.withOpacity(0.08)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? AppCustomColors.appPrimaryColor
              : Colors.transparent,
          width: 1.2,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            color: isSelected
                ? AppCustomColors.appPrimaryColor
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight:
                isSelected ? FontWeight.w700 : FontWeight.normal,
                color: isSelected
                    ? AppCustomColors.appPrimaryColor
                    : null,
              ),
            ),
          ),
          if (isSelected)
            Image.asset(
              icon,
              color: AppCustomColors.appPrimaryColor,
            ),
        ],
      ),
    ),
  );
}
