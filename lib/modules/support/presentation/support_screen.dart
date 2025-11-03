import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';

import '../../../core/presentation/widgets/app_text.dart';
import '../../../utils/theme/appColors.dart';
import '../../../utils/theme/appImages.dart';


class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            60.heightBox,
            AppText("الدعم الفني" , size: 25.sp,).bold().toCenter(),
            24.heightBox,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Image.asset(AppImagePath.call , width: 48,height: 48,),
                  24.widthBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText("اتصل بنا" , size: 15.sp,).bold(),
                      AppText("+249912312312" , color: Colors.red,),
                    ],
                  ))
                ],
              ),
            ),
            28.heightBox,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Image.asset(AppImagePath.whatsApp , width: 48,height: 48,),
                  24.widthBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText("راسلنا على الواتساب" , size: 15.sp,).bold(),
                      AppText("+249912312312" , color: Colors.green,),
                    ],
                  ))
                ],
              ),
            ),
            28.heightBox,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText("الاسئلة الاكثر شيوعا" , size: 15.sp,).bold(),
                  20.heightBox,
                  Row(
                    children: [
                      Expanded(child:AppText("ما هي مدة التوصيل" , align: TextAlign.start,)),
                      Icon(Icons.keyboard_arrow_down_outlined , color: AppCustomColors.colorGrey75,),
                    ],
                  ),
                  16.heightBox,
                  Row(
                    children: [
                      Expanded(child:AppText("هل التوصيل مجاني" , align: TextAlign.start,)),
                      Icon(Icons.keyboard_arrow_down_outlined , color: AppCustomColors.colorGrey75,),
                    ],
                  ),
                  16.heightBox,
                  Row(
                    children: [
                      Expanded(child:AppText("متي يتاح الدفع عن الاستلام" , align: TextAlign.start,)),
                      Icon(Icons.keyboard_arrow_down_outlined , color: AppCustomColors.colorGrey75,),
                    ],
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
