import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';


import '../../../../app.dart';
import '../../../../awesome_extension_package/src/widgets/avatar_image.dart';
import '../../../../core/model/user.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/styles/decoration.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_button.dart';

class ProfileView extends StatefulWidget {
  final UserModel? profileModel;

  const ProfileView({super.key, required this.profileModel});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    {
      TextEditingController nameController = TextEditingController();
      TextEditingController emailController = TextEditingController();
      TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          60.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImagePath.backButton , width: 48,height: 48,).onTap((){AppNavigation.goBack();}),
              AppText("معلومات الحساب" , size: 25.sp,).bold(),
              SizedBox()
            ],
          ),
          24.heightBox,
          AppText("الأسم" , size: 15.sp,).bold(),
          3.heightBox,
          EditText(
            hint: "الاسم ",
            type: TextInputType.name,
            controller: nameController,
            // prefixImage: AppImagePath.username,
            // validateFunc: _validateName,
          ),
          const SizedBox(height: 16),
          //*Email
          AppText("البريد الإلكتروني" , size: 15.sp,).bold(),
          3.heightBox,
          EditText(
            hint: Strings().enterYourEmail,
            type: TextInputType.emailAddress,
            controller: emailController,
            // prefixImage: AppImagePath.email,
            // validateFunc: _validateEmail,
          ),
          const SizedBox(height: 16),
          //*Phone
          AppText("رقم الهاتف" , size: 15.sp,).bold(),
          3.heightBox,
          EditText(
            hint: Strings().enterYourPhone,
            type: TextInputType.phone,
            // prefixImage: AppImagePath.phone,
            controller: phoneController,
            // validateFunc: _validatePhone,
          ),
          const SizedBox(height: 20),
          AppButton(onTap: (){
            AppNavigation.goBack();
          },title: "حفظ",color: AppCustomColors.appPrimaryColor,isRounded: false,)
        ],
      ).paddingSymmetric(horizontal: 16.w),
    ) ;
  }

}
