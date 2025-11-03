import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/utils/theme/appColors.dart';

import '../../../../awesome_extension_package/awesome_extensions.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../core/presentation/widgets/component/inputs/suffix_country.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/auth/logic/password/password_cubit.dart';
import '../../../../modules/location/data/models/country_model.dart';
import '../../../../utils/helpers/validations/validators.dart';
import '../../../../utils/resources/values_manager.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/text_required.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  CountryModel? selectedCountry;
  var formKey = GlobalKey<FormState>();
  bool isPhone = true;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
          child: Scaffold(
        appBar: const CustomAppBar(
          isBackButtonExist: true,
          title: 'Forget Password',
        ),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('One step closer!', fontWeight: FontWeight.w700, size: 17.sp, align: TextAlign.start,),
              AppText('Enter the verification code we just sent to complete your registration.', size: 17.sp, align: TextAlign.start,),
              32.heightBox,
              // //*Email
              TextRequired(
                text: 'Email Address'.tr(),
                text2: ' *',
              ),
               2.heightBox,
               EditText(
                  hint: Strings().enterYourEmail,
                  type: TextInputType.emailAddress,
                  controller: emailController,
                 prefixImage: AppImagePath.email,
                  validateFunc: _validateEmail,
                ),
              const SizedBox(height: 46),
              //* Forget password button
              _forgetPasswordButton(),
              const SizedBox(height: 8),
            ],
          ),
        ).paddingSymmetric(horizontal: 20.w),
      )),
    );
  }

  _forgetPasswordButton() {
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return Column(
          children: [
            AppButton(
              title: Strings().send,
              loading: state.forgetPasswordState == BaseState.loading,
              color: AppCustomColors.appPrimaryColor,
              textColor: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 17.sp,
              isRounded: false,
              onTap: () {
                AppNavigation.toNamed(Routes.otp, arguments: {
                  "phone": emailController.text,
                  "phoneCountryId": '0',
                  'isForgetPassword': 'true',
                  "sendOtp": "true",
                });
                // FocusScope.of(context).unfocus();
                // if (formKey.currentState!.validate()) {
                //   context.read<PasswordCubit>().forgetPassword(
                //         phoneOrEmail: isPhone
                //             ? phoneController.text
                //             : emailController.text,
                //         countryId: '${selectedCountry?.id ?? ""}',
                //         isPhone: isPhone,
                //       );
                // }
              },
            ),
          ],
        );
      },
    );
  }

  _validatePhone(value) {
    //check if country is selected
    if (selectedCountry == null) {
      return Strings().selectCountry;
    }
    //check if phone is empty
    if (value.isEmpty) {
      return Strings().phoneIsRequired;
    }
  }

  _validateEmail(value) {
    //check if  is empty
    if (value.isEmpty) {
      return Strings().emailRequired;
    }
    //check if email is valid
    if (!Validators.isEmail(value)) {
      return Strings().emailIsNotValid;
    }
  }
}
