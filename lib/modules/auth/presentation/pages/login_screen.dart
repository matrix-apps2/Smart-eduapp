
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../awesome_extension_package/awesome_extensions.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../core/presentation/widgets/component/inputs/suffix_country.dart';
import '../../../../core/presentation/widgets/dialog/code_picker_widget.dart';
import '../../../../core/presentation/widgets/dialog/country_picker_dialog.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/auth/domain/usecases/login_usecase.dart';
import '../../../../modules/auth/logic/login/login_cubit.dart';
import '../../../../modules/location/data/models/country_model.dart';
import '../../../../utils/helpers/validations/validators.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic>? selectedCountry;
  String _countryDialCode = '+20';
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().reset();
    phoneController.text = kDebugMode ? "" : "";
    passwordController.text = kDebugMode ? "" : "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //appBar: CustomAppBar(title: Strings().login),
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.state == BaseState.error) {
              if (state.error is ReadableFailure) {
                ReadableFailure failure = state.error as ReadableFailure;
                AppSnackbar.show(
                  context: context,
                  title: Strings().notification,
                  message: failure.message,
                  type: SnackbarType.error,
                );
              }
            }
          },
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Gap(30.h),
                CustomImage(imageUrl: AppImagePath.logo , width: 220,),
                // Gap(20.h),
                AppText(
                  "We’ve been missed",
                  size: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppCustomColors.colorGrey85,
                ),
                Gap(5.h),
                AppText(
                  "Sign In to continue",
                  size: 19.sp,
                  fontWeight: FontWeight.w700,
                ),
                Gap(30.h),
                //* Inputs
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //*Phone
                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text("Phone Number")),
                        Row(
                          children: [
                            Container(
                              width: 95.w,
                              height: 44.h,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color: AppCustomColors.colorGrey5,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: CountryCodePicker(
                                onChanged: (CountryCode countryCode) {
                                  _countryDialCode = countryCode.dialCode ?? '';
                                },
                                initialSelection: _countryDialCode,
                                favorite: [_countryDialCode],
                                showDropDownButton: true,
                                enabled: true,
                                padding: EdgeInsets.zero,
                                showFlagMain: false,

                                textStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge?.color),

                              ),
                            ),
                            Flexible(
                              child: EditText(
                                hint: "XXX xx xxxx xxxx",
                                type: TextInputType.phone,
                                controller: phoneController,
                                borderColor: Colors.transparent,
                                radius: 8,
                                validateFunc: _validatePhone,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Text("Password")),
                        EditText(
                          hint: Strings().enterYourPassword,
                          validateFunc: _validatePassword,
                          controller: passwordController,
                          borderColor: Colors.transparent,
                          password: true,
                          lines: 1,
                          prefixImage: AppImagePath.pass,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){AppNavigation.toNamed(Routes.forgetPasswordScreen);},
                            child: AppText(
                              'Forgot Your Password?',
                              size: 13.sp,
                              fontWeight: FontWeight.w700,
                              color: AppCustomColors.appPrimaryColor,
                            ).paddingOnly(top: 8.h, bottom: 24.h),
                          ),
                        ),
                      ],
                    )),
                Gap(30.h),
                //*Login button
                AppButton(
                  onTap: () {
                    AppNavigation.toNamed(Routes.layout);
                        //
                        // AppNavigation.toNamed(
                        //     Routes.otp,
                        //     arguments: {
                        //       "phone": "022222",
                        //       "phoneCountryId": "00",
                        //       "sendOtp": "false",
                        //       "otp": "0000",
                        //     });
                  },
                  // height: 40.h,
                  isRounded: false,
                  title: "Sign In",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.black,
                  color: AppCustomColors.appPrimaryColor,
                ),
                SizedBox(height: 20.h),
                4.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      'Don’t have an account?',
                      size: 17.sp,
                      color: Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                    GestureDetector(
                      onTap: () => AppNavigation.toNamed(Routes.registerScreen),
                      child: AppText(
                        'Sign Up',
                        color: AppCustomColors.appPrimaryColor,
                        size: 17.sp,
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 8.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      'Continue as a',
                      size: 17.sp,
                      color: Theme.of(context).textTheme.bodyMedium!.color!,
                    ),
                    GestureDetector(
                      onTap: () {
                        AppSnackbar.show(
                          context: context,
                          message: "working on it",
                        );
                      },
                      child: AppText(
                        'Guest',
                        color: AppCustomColors.appPrimaryColor,
                        size: 17.sp,
                      ),
                    ),
                  ],
                ),

                12.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      'arabic'.tr(),
                      size: 13.sp,
                      color: AppCustomColors.appGreyLight,
                    ),
                    8.widthBox,
                    SvgPicture.asset(
                      AppIcons.language,
                      colorFilter: ColorFilter.mode(
                        AppCustomColors.appGreyLight,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _loginButton() {
  //   return BlocBuilder<LoginCubit, LoginState>(
  //     builder: (context, state) {
  //       return Column(
  //         children: [
  //           AppButton(
  //             height: 40.h,
  //             width: 160.w,
  //             title: Strings().login,
  //             loading: state.state == BaseState.loading,
  //             onTap: () {
  //               FocusScope.of(context).unfocus();
  //               if (formKey.currentState!.validate()) {
  //                 context.read<LoginCubit>().login(
  //                       context: context,
  //                       params: LoginParams(
  //                         phone: phoneController.text,
  //                         password: passwordController.text,
  //                         phoneCountryId: selectedCountry!.id.toString(),
  //                       ),
  //                     );
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  _validatePassword(value) {
    //check if length is smaller than 6
    if (value.length < 6) {
      return Strings().passwordLengthTooShort;
    }
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

// class SocialMediaRow extends StatelessWidget {
//   const SocialMediaRow({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(AppImagePath.facebookIcon),
//         Gap(5.w),
//         Image.asset(AppImagePath.googleIcon),
//         Gap(5.w),
//         Image.asset(AppImagePath.appleIcon),
//       ],
//     );
//   }
// }
