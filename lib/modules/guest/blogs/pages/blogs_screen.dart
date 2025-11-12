import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../widgets/blog_card_widget.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> with SingleTickerProviderStateMixin{

  final List<Map<String, String>> blogs = List.generate(6, (index) {
    return {
      "title": "Service Title Goes Here",
      "date": "25 Mar, 2023",
      "image": AppImagePath.blogImg,
    };
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Blogs',
        isBackButtonExist: false,
      ),
      body: SafeArea(
        child: blogs.isNotEmpty? Column(
          children: [
            Expanded(
              child: MasonryGridView.builder(
                itemCount: blogs.length,
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.only(top: 12.h),
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return BlogCardWidget(
                    title: blog["title"]!,
                    image: blog["image"]!, date: blog["date"]!,
                  );
                },
              ).paddingSymmetric(horizontal: 16.w),
            )
          ],
        ) : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImagePath.blogsEmpty),
            AppText('Blog Posts Are On The Way!', size: 17.sp, fontWeight: FontWeight.w700,),
            AppText('We\'re busy crafting great content. Please check out our other pages, or come back soon!', size: 17.sp, color: AppCustomColors.colorGrey80,),
          ],
        ).paddingSymmetric(horizontal: 43.w),
      ),
    );
  }
}
