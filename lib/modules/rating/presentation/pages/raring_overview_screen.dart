import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../utils/theme/appImages.dart';
import '../../data/model/rate_model.dart';

class RatingOverviewScreen extends StatelessWidget {
  RatingOverviewScreen({super.key});

  final List<RateModel> dummyReviews = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Rating Overview',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== Overall Rating Card =====
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppCustomColors.colorLightYellow5,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImagePath.ratingLeft),
                      AppText(
                        "4.0",
                        size: 28.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                      Image.asset(AppImagePath.ratingRight),
                    ],
                  ),
                  8.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) => Icon(
                        index < 4 ? Icons.star_rounded : Icons.star_outline_rounded,
                        color: AppCustomColors.amberColor,
                        size: 22.sp,
                      ),
                    ),
                  ),
                  8.heightBox,
                  const Divider(),
                  4.heightBox,
                  const Text(
                    "Based on 125 reviews",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  4.heightBox,

                  const Divider(),

                  10.heightBox,

                  /// Rating Bars
                  _ratingRow("Excellent", 4.5, Colors.green),
                  const SizedBox(height: 6),
                  _ratingRow("Good", 4.0, Colors.lightGreen),
                  const SizedBox(height: 6),
                  _ratingRow("Average", 3.5, Colors.orange),
                  const SizedBox(height: 6),
                  _ratingRow("Poor", 2.5, Colors.deepOrange),
                  const SizedBox(height: 6),
                  _ratingRow("Very Poor", 2.5, Colors.red),
                ],
              ),
            ),

            8.heightBox,

            /// ===== Reviews Section =====
            AppText(
              "Reviews",
              size: 17.sp,
              fontWeight: FontWeight.w700,
            ),

            8.heightBox,

            // لو مفيش مراجعات
            dummyReviews.isEmpty? Center(
              child: Column(
                children: [
                  Image.asset(
                    AppImagePath.reviewEmpty, // ← غيّر المسار حسب صورتك
                    // height: 120,
                  ),
                  8.heightBox,
                  AppText(
                    "No Reviews Yet!",
                    size: 17.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 6),
                  AppText(
                    "Your reviews will appear here, please come back later.",
                    align: TextAlign.center,
                    size: 17.sp,
                    color: AppCustomColors.colorGrey80,
                  ),
                ],
              ),
            ):
            ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: dummyReviews.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_, __) => const Divider(height: 32),
              itemBuilder: (context, index) {
                final review = dummyReviews[index];
                return _buildReviewItem(review);
              },
            ),

          ],
        ),
      ),
    );
  }

  /// Widget لصف التقييمات
  Widget _ratingRow(String label, double value, Color color) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              label,
              size: 13.sp,
            ),
            Spacer(),
            Text(
              value.toStringAsFixed(1),
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: value / 5,
                  backgroundColor: Colors.grey.shade200,
                  color: color,
                  minHeight: 8,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildReviewItem(RateModel review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ===== Header: Profile + Name + Time =====
        Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: NetworkImage(review.img!),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  review.name ?? 'Unknown User',
                  size: 13.sp,
                ),
                4.heightBox,
                AppText(
                  _timeAgo(review.createdAt!),
                  size: 13.sp,
                  pv: 0,
                ),
              ],
            ),
          ],
        ),

        8.heightBox,

        /// ===== Stars =====
        Row(
          children: List.generate(5, (index) {
            final filled = index < review.rating!.round();
            return Icon(
              filled ? Icons.star_rounded : Icons.star_outline_rounded,
              color: filled ? AppCustomColors.amberColor : AppCustomColors.colorGrey75,
              size: 20.sp,
            );
          }),
        ),

        const SizedBox(height: 8),

        /// ===== Review Body =====
        AppText(
          review.body ?? '',
          size: 13.sp,
          pv: 0,
          align: TextAlign.start,
        ),
      ],
    );
  }

  /// دالة لتحويل الوقت لعبارة مثل "1h ago"
  String _timeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else {
      return '${diff.inDays}d ago';
    }
  }
}
