import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
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
import '../../../../generated/assets.dart';
import '../../../../modules/auth/domain/usecases/register/register_usecase.dart';
import '../../../../modules/auth/logic/register/register_cubit.dart';
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

import '../../../../widgets/text_required.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool agreementIsChecked = false;
  // CountryModel? selectedCountry;
  String? selectedCountry;
  String _countryDialCode = '+20';

  var formKey = GlobalKey<FormState>();
  bool male = true;
  bool female = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // if (kDebugMode) {
    //   nameController.text = "Developer";
    //   emailController.text = "developer@developer.com";
    //   phoneController.text = "1010101010";
    //   passwordController.text = "123123";
    //   agreementIsChecked = true;
    //   selectedCountry =
    //       CountryModel(name: "Egypt", code: "eg", phoneCode: "20");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<RegisterCubit, RegisterState>(
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Gap(4.h),
              Row(
                children: [
                  Spacer(),
                  AppText('Sign Up to get started', fontWeight: FontWeight.w700, size: 15.sp,),
                  Spacer(),
                  CustomImage(imageUrl: AppImagePath.logo , width: 52,),
                ],
              ),

              //* Inputs
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //*Name
                      TextRequired(
                        text: 'Full Name'.tr(),
                        text2: ' *',
                      ),
                      2.heightBox,
                      EditText(
                        hint: "Enter full name here...",
                        type: TextInputType.name,
                        controller: nameController,
                        prefixImage: AppImagePath.username,
                        validateFunc: _validateName,
                      ),
                      SizedBox(height: 4.h),
                      //*Email
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
                      SizedBox(height: 4.h),
                      //*Phone
                      TextRequired(
                          text: "Phone Number",
                        text2: ' *',
                      ),
                      2.heightBox,
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

                      SizedBox(height: 4.h),
                      TextRequired(
                        text: 'Country'.tr(),
                        text2: ' *',
                      ),
                      2.heightBox,
                      GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              setState(() {
                                selectedCountry = "${country.flagEmoji} ${country.name}";
                                _countryDialCode = country.countryCode;
                              });
                            },
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight: MediaQuery.of(context).size.height * 0.6, // 60% من الشاشة
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  child: Image.asset(AppImagePath.locationPin, height: 16, width: 0.66),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        },
                        child: AbsorbPointer(
                          child: EditText(
                            hint: Strings().selectCountry,
                            controller: countryController,
                            prefixImage: AppImagePath.locationPin,
                            suffixWidget: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
                            // validateFunc: _validateEmail,
                          ),
                        ),
                      ),

                      SizedBox(height: 4.h),
                      //*Password
                      TextRequired(
                        text: 'Password'.tr(),
                        text2: ' *',
                      ),
                      2.heightBox,
                      EditText(
                        hint: Strings().enterYourPassword,
                        controller: passwordController,
                        prefixImage: AppImagePath.pass,
                        validateFunc: _validatePassword,
                      ).passwordType(),
                      SizedBox(height: 4.h),

                      TextRequired(
                        text: 'Confirm Password'.tr(),
                        text2: ' *',
                      ),
                      2.heightBox,
                      EditText(
                        hint: Strings().enterYourPassword,
                        controller: confirmPasswordController,
                        prefixImage: AppImagePath.pass,
                        validateFunc: _validatePassword,
                      ).passwordType(),

                      Row(
                        children: [
                          Checkbox(
                            side: BorderSide(
                              width: 1,
                              color: AppCustomColors.appPrimaryColor,
                            ),
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            activeColor: AppCustomColors.appPrimaryColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                          ),

                          TapEffect(
                            onClick: ()=> AppNavigation.toNamed(Routes.testScreen),
                            child: Row(
                              children: [
                                AppText(
                                  'I agree with ',
                                  size: 15.sp,
                                  ph: 0,
                                ),
                                AppText(
                                  'Terms & Condition',
                                  size: 15.sp,
                                  color: AppCustomColors.appPrimaryColor,
                                  ph: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),

              SizedBox(height: 8.h),
              AppButton(
                onTap: () {
                  if(phoneController.text.isNotEmpty && _countryDialCode.isNotEmpty) {
                    AppNavigation.toNamed(Routes.otp, arguments: {
                    "phone": phoneController.text,
                    "phoneCountryId": _countryDialCode,
                    "sendOtp": "true",
                  });
                  }
                },
                // height: 40.h,
                isRounded: false,
                title: "Sign Up",
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                textColor: Colors.black,
                color: AppCustomColors.appPrimaryColor,
              ),

              8.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'Already have an account?',
                    size: 17.sp,
                    color: Theme.of(context).textTheme.bodyMedium!.color!,
                  ),
                  GestureDetector(
                    onTap: () => AppNavigation.toNamed(Routes.loginScreen),
                    child: AppText(
                      'Log In',
                      color: AppCustomColors.appPrimaryColor,
                      size: 17.sp,
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 4.h),

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
                      AppSnackbar.show(context: context, message: 'working on it...');
                    },
                    child: AppText(
                      'Guest',
                      color: AppCustomColors.appPrimaryColor,
                      size: 17.sp,
                    ),
                  ),
                ],
              ),

              10.heightBox,
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
    );
  }

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

  _validateName(value) {
    //check if  is empty
    if (value.isEmpty) {
      return Strings().nameRequired;
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

  _registerButton() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return AppButton(
          // height: 40.h,
          title: Strings().register,
          loading: state.state == BaseState.loading,
          color: AppCustomColors.appPrimaryColor,
          isRounded: false,
          onTap: () {
            AppNavigation.toNamedOff(Routes.layout);
          },
        );
      },
    );
  }
}
