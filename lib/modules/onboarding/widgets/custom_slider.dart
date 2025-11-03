// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../core/presentation/widgets/app_text.dart';
import '../../../utils/theme/appColors.dart';

class SliderItem {
  final String imagePath;
  final String? title;

  SliderItem({
    required this.imagePath,
     this.title,
  });
}

class CustomSliderImage extends StatefulWidget {
  final List<SliderItem> items;
  CarouselSliderController? sliderController;
  final ValueChanged<int>? onPageChanged;

  CustomSliderImage({
    Key? key,
    required this.items,
    this.sliderController,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<CustomSliderImage> createState() => _CustomSliderImageState();
}

class _CustomSliderImageState extends State<CustomSliderImage> {
  // int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.sliderController,
      items: widget.items.map((item) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 170.h,
              width: 216.w,
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            24.heightBox,
            AppText(
              item.title,
              align: TextAlign.center,
              size: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppCustomColors.appWhiteColor,
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        height: 300.h,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          widget.onPageChanged?.call(index);
        },
      ),
    );
  }
}
