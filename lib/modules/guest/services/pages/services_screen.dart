import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../widgets/service_card_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  final List<String> tabs = [
    "All",
    "Master's & PhD",
    "Undergraduate",
    "Various Levels"
  ];

  final List<Map<String, String>> services = List.generate(6, (index) {
    return {
      "title": "Service Title Goes Here",
      "image":
      AppImagePath.serviceImg,
    };
  });

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Services',
        onBackPress: ()=> AppNavigation.goBack(),
        rightIcon: Image.asset(AppImagePath.searchIcon),
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
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: GridView.builder(
                      itemCount: services.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ServiceCard(
                          title: service["title"]!,
                          image: service["image"]!,
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
