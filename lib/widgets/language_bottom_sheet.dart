import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/utils/theme/appImages.dart';

import '../utils/theme/appColors.dart';

void showLanguageBottomSheet(
    BuildContext context,
    Function(String) onLanguageSelected,
    String currentLang,
    ) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      String selectedLang = currentLang;

      return StatefulBuilder(
        builder: (context, setState) {
          return AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: AppCustomColors.appWhiteColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppCustomColors.appPrimaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "Select Language".tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppCustomColors.appSubColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Arabic
                  GestureDetector(
                    onTap: () => setState(() => selectedLang = "ar"),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: selectedLang == "ar" ? Colors.grey[200] : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.arSvg),
                          SizedBox(width: 12),
                          Text("AR", style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Arabic",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Saudi Arabia",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: selectedLang == "ar"
                                      ? AppCustomColors.appSubColor
                                      : Colors.grey, // أو اللون اللي تحبه لغير المحدد
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // English
                  GestureDetector(
                    onTap: () => setState(() => selectedLang = "en"),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: selectedLang == "en" ? Colors.grey[200] : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.enSvg),
                          SizedBox(width: 12),
                          Text("EN", style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("English", style: TextStyle(fontSize: 15.sp, color: Colors.black)),
                              Text("United State", style: TextStyle(fontSize: 15.sp, color: AppCustomColors.appSubColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // زر تغيير اللغة
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: AppCustomColors.appPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        onLanguageSelected(selectedLang);
                      },
                      child: Text(
                        'Confirm'.tr(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}