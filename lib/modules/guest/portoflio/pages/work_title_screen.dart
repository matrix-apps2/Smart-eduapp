import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/core/presentation/widgets/app_text.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/routes/navigation_services.dart';

class WorkTitleScreen extends StatefulWidget {
  const WorkTitleScreen({super.key});

  @override
  State<WorkTitleScreen> createState() => _WorkTitleScreenState();
}

class _WorkTitleScreenState extends State<WorkTitleScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<String> pages = List.generate(
    22,
        (index) => '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
It has survived not only five centuries.

Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
It has survived not only five centuries, but also the leap into electronic typesetting.
''',
  );

  void _nextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    if (currentPage > 0) {
      _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Work Title Goes Here',
        onBackPress: ()=> AppNavigation.goBack(),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => currentPage = index),
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    pages[index],
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(

                    color: currentPage > 0
                        ? AppCustomColors.colorLightBlue5 : AppCustomColors.colorGrey5,
                    borderRadius: BorderRadius.circular(12.r)
                  ),
                  child: IconButton(
                    onPressed: _prevPage,
                    icon: const Icon(Icons.arrow_back_rounded, color: Colors.black54),
                  ),
                ),
                Text(
                  '${currentPage + 1} / ${pages.length}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ).paddingSymmetric(horizontal: 8.w),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: currentPage < pages.length - 1
                         ? AppCustomColors.colorLightBlue5 : AppCustomColors.colorGrey5,
                      borderRadius: BorderRadius.circular(12.r)
                  ),
                  child: IconButton(
                    onPressed: _nextPage,
                    icon: const Icon(Icons.arrow_forward_rounded, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
