import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../modules/packages/data/models/packages_model.dart';
import '../../../../utils/debug/echo.dart';
import '../../../../utils/styles/decoration.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';

class PackagesView extends StatefulWidget {
  final List<PackagesModel> list;
  const PackagesView({Key? key, required this.list}) : super(key: key);

  @override
  State<PackagesView> createState() => _PackagesViewState();
}

class _PackagesViewState extends State<PackagesView> {
  late PageController _pageController;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      if (_currentPage == _pageController.page!.round()) return;
      kEcho("Page Changed");
      _currentPage = _pageController.page!.round();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [
              ...widget.list.map((e) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: const BoxDecoration()
                          .radius(20)
                          .customColor(const Color(0xffF9FAFB)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: const BoxDecoration()
                                .radius(20)
                                .customColor(const Color(0xffF9FAFB)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                AppText(e.name).headerExtra().bold(),
                                const SizedBox(height: 8),
                                AppText(e.description).start(),
                                Row(
                                  children: [
                                    AppText(e.price).header().bold(),
                                    AppText(" / ${e.duration}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ...e.features.map((e) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: const BoxDecoration()
                                  .radius(20)
                                  .customColor(const Color(0xffF9FAFB)),
                              child: Row(
                                children: [
                                  const Icon(Icons.check, color: Colors.green),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(e)),
                                ],
                              ),
                            );
                          }).toList(),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: AppButton(
                                onTap: () {}, title: Strings().subscribe),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
        const SizedBox(height: 12),
        //dots
        SizedBox(
          height: 12,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              bool isActive = _currentPage == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 22 : 12,
                height: 12,
                decoration: const BoxDecoration().radius(10).customColor(
                    isActive ? Theme.of(context).primaryColor : Colors.grey),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
