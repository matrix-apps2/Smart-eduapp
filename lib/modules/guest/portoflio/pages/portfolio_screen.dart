import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../widgets/portfolio_card_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  final List<String> tabs = [
    "All",
    "Engineering & Programming",
    "Business Administration",
  ];

  final List<Map<String, String>> PortoflioList = List.generate(6, (index) {
    return {
      "title": "Work Title Goes Here...",
      "image":
      AppImagePath.portoflioImg,
    };
  });

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Portfolio',
        isBackButtonExist: false,
        // onBackPress: ()=> AppNavigation.goBack(),
        // rightIcon: Image.asset(AppImagePath.searchIcon),
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔹 Tabs Bar
            Container(
              width: double.infinity,
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(),
                padding: EdgeInsets.zero, // إزالة الـ padding الافتراضي
                labelPadding: EdgeInsets.symmetric(horizontal: 4.w), // تقليل المسافة بين التابات
                tabs: tabs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final tab = entry.value;
                  return Tab(
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return ListenableBuilder(
                          listenable: _tabController,
                          builder: (context, child) {
                            final isSelected = _tabController.index == index;
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h), // تقليل الـ padding الداخلي
                              margin: EdgeInsets.symmetric(horizontal: 2.w), // تقليل الـ margin بين التابات
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                ),
                              ),
                              child: Text(
                                tab,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }).toList(),
              )
            ),

            /// 🔹 محتوى التابات
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((_) {
                  return MasonryGridView.builder(
                    itemCount: PortoflioList.length,
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    padding: EdgeInsets.only(top: 12.h),
                    itemBuilder: (context, index) {
                      final portofolio = PortoflioList[index];
                      return PortoflioCard(
                        title: portofolio["title"]!,
                        image: portofolio["image"]!,
                      );
                    },
                  ).paddingSymmetric(horizontal: 16.w);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
