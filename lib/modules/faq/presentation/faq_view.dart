import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../modules/faq/data/models/faq_model.dart';
import '../../../../utils/styles/decoration.dart';
import 'package:flutter/material.dart';

class FaqView extends StatelessWidget {
  final List<FaqModel> list;
  const FaqView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...list.map((e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration()
                  .radius(20)
                  .customColor(const Color(0xffF9FAFB)),
              child: ExpansionTile(
                title:
                    AppText(e.question, color: Colors.black87).start().header(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                collapsedBackgroundColor: const Color(0xffF9FAFB),
                backgroundColor: const Color(0xffF9FAFB),
                children: [
                  AppText(e.answer, ph: 12, pv: 6).start(),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
