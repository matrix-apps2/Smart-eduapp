import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/resources/resources.dart';
import 'package:smart_operation/utils/routes/app_routes.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/small_icon_button.dart';
import '../../../rating/data/model/rate_model.dart';
import '../../../task_details/presentation/widget/review_item.dart';
import '../widgets/blog_card_widget.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({Key? key,}) : super(key: key);

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Map<String, String> blog = {
      "title": "Service Title Goes Here",
      "date": "25 Mar, 2023",
      "image": AppImagePath.blogImg,
    };
  final List<RateModel> sampleReviews = [
    RateModel(
      id: 1,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=3',
      rating: 4.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    RateModel(
      id: 1,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=3',
      rating: 4.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    RateModel(
      id: 1,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=3',
      rating: 4.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    RateModel(
      id: 1,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=3',
      rating: 4.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    RateModel(
      id: 2,
      name: 'User Name',
      body: 'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=5',
      rating: 3.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    RateModel(
      id: 2,
      name: 'User Name',
      body: 'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=5',
      rating: 3.5,
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
    ),
    RateModel(
      id: 3,
      name: 'User Name',
      body:
      'Lorem ipsum dolor sit amet consectetur. Hendrerit suspendisse et placerat mat luctus.',
      img:
      'https://i.pravatar.cc/150?img=8',
      rating: 5.0,
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    ),
  ];
  TextEditingController addMessagesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Blog Details',
          onBackPress: () => AppNavigation.goBack(),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🟦 Blog Card
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      child: BlogCardWidget(
                        title: blog["title"]!,
                        image: blog["image"]!,
                        date: blog["date"]!,
                        imgHeight: 328,
                      ),
                    ),

                    // 🟨 Tab Bar Container
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: AppCustomColors.appPrimaryColor,
                        unselectedLabelColor: Colors.black87,
                        dividerColor: Colors.transparent,
                        labelStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorColor: AppCustomColors.appPrimaryColor,
                        indicatorWeight: 3,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(text: "Blog"),
                          Tab(text: "Comments"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              // 🟩 Blog content scrollable
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                          "It has survived not only five centuries.",
                      style: TextStyle(fontSize: 15.sp, height: 1.6, color: Colors.black87),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: TextStyle(fontSize: 15.sp, height: 1.6, color: Colors.black87),
                    ),
                  ],
                ),
              ),

              // 🟦 Comments tab (Scrollable list + input row)
              Column(
                children: [
                  Expanded(
                    child: sampleReviews.isEmpty
                        ? Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImagePath.chatEmpty),
                            8.heightBox,
                            AppText("No Task Comments Yet!",
                                size: 17.sp, fontWeight: FontWeight.w700),
                            6.heightBox,
                            AppText(
                              "Task comments will appear here, please come back later.",
                              align: TextAlign.center,
                              size: 17.sp,
                              color: AppCustomColors.colorGrey80,
                            ).paddingSymmetric(horizontal: 23),
                          ],
                        ),
                      ),
                    )
                        : ListView.builder(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                      itemCount: sampleReviews.length,
                      itemBuilder: (context, index) {
                        final review = sampleReviews[index];
                        return buildReviewItem(review);
                      },
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 240.w,
                          height: 50.h,
                          alignment: Alignment.center,
                          child: EditText(
                            hint: 'write a comment...'.tr(),
                            type: TextInputType.text,
                            controller: addMessagesController,
                          ),
                        ).paddingSymmetric(horizontal: 4.w),
                      ),
                      SmallIconButton(
                        width: 50.w,
                        icon: AppIcons.send,
                        onTap: () {},
                        color: AppCustomColors.appPrimaryColor,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
