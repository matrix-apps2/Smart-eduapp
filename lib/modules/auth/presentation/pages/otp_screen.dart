import 'dart:async';


import '../../../../app.dart';
import '../../../../awesome_extension_package/awesome_extensions.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../core/presentation/widgets/dialog/base/simple_dialogs.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../../../core/storge/shared_pref/storage_keys.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/auth/logic/password/password_cubit.dart';
import '../../../../modules/auth/logic/verify_account/verify_account_cubit.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:dartz/dartz.dart' as dartz;

class OtpScreen extends StatefulWidget {
  final String phone;
  final String phoneCountryId;
  final String otp;
  final bool sendOtp;
  final bool isForgetPassword;
  const OtpScreen({
    super.key,
    required this.phone,
    required this.phoneCountryId,
    required this.otp,
    required this.sendOtp,
    required this.isForgetPassword,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 120);
  String remainMinits = '';
  String remainseconds = '';
  String otp = '';
  String otpCodeForDebug = '';
  @override
  void initState() {
    otpCodeForDebug = widget.otp;
    if (widget.sendOtp && !widget.isForgetPassword) {
      context.read<VerifyAccountCubit>().sendOtp(
            phone: widget.phone,
            phoneCountryId: widget.phoneCountryId,
          );
    }
    startTimer();
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(seconds: 120));
    startTimer();
  }

  void setCountDown() {
    setState(() {
      final seconds = myDuration.inSeconds - 1;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(isBackButtonExist: true, title: 'Verification Code',),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText('One step closer!', fontWeight: FontWeight.w700, size: 17.sp, align: TextAlign.start,),
          AppText('Enter the verification code we just sent to complete your registration.', size: 17.sp, align: TextAlign.start,),

          SizedBox(height: 32.h),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AppText(_handleDuration(myDuration), size: 16.sp, color: AppCustomColors.appPrimaryColor,)),
          SizedBox(height: 32.h),

          //*OTP∆
          OTPTextField(
            length: 4,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: AppCustomColors.colorGrey5,
              borderColor: Colors.transparent,

            ),
            outlineBorderRadius: 8.r,
            width: MediaQuery.of(context).size.width * .6,
            fieldWidth: 44.w,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) {},
            onChanged: (value) {
              otp = value;
            },
          ).toCenter(),
          const SizedBox(height: 24),
          //* Timer
          //*Resend note

          //*verifry button
          if (!widget.isForgetPassword) _verifryButton(),
          if (widget.isForgetPassword) _verifryButtonForForgetPassword(),
          const SizedBox(height: 8),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText('${Strings().iDidNotReceiveAnyCode}?', size: 16.sp,),
              AppText(Strings().resend, ph: 0, size: 16.sp,).primary(context).onTap(() {
                resetTimer();
              }),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }

  _verifryButton() {
    return BlocBuilder<VerifyAccountCubit, VerifyAccountState>(
      builder: (context, state) {
        return AppButton(
          loading: state.state == BaseState.loading,
          title: Strings().verify,
          height: 40.h,
          color: AppCustomColors.appPrimaryColor,
          fontWeight: FontWeight.w700,
          textColor: Colors.black,
          isRounded: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (otp.length != 4) {
              AppSnackbar.show(
                  context: context, message: Strings().enterValidOtp);
              return;
            }
              AppNavigation.toNamed(Routes.completeProfile);
          },
        );
      },
    );
  }

  _verifryButtonForForgetPassword() {
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return AppButton(
          loading: state.resetPasswordState == BaseState.loading,
          title: Strings().verifyNow,
          height: 40.h,
          color: AppCustomColors.appPrimaryColor,
          fontWeight: FontWeight.w700,
          textColor: Colors.black,
          isRounded: false,
          onTap: () async {
            FocusScope.of(context).unfocus();
            if (otp.length != 4) {
              AppSnackbar.show(
                  context: context, message: Strings().enterValidOtp);
              return;
            }
            AppNavigation.toNamed(Routes.changePassword);

            // dartz.Either<ErrorModel, UserModel> result =
            //     await context.read<PasswordCubit>().verifyResetPassword(otp);
            //
            // result.fold(
            //   (l) => l is ReadableFailure
            //       ? AppSnackbar.show(context: context, message: l.message)
            //       : null,
            //   (r) {
            //     AppPrefs prefs = getIt<AppPrefs>();
            //     prefs.set(AppPrefsKeys.token, r.token);
            //     prefs.set(AppPrefsKeys.kuserId, r.id);
            //     Dio dio = getIt<Dio>();
            //     dio.options.headers["Authorization"] = "Bearer ${r.token}";
            //     globalUser = r;
            //     AppNavigation.toNamedOffAll(Routes.layout);
            //     Future.delayed(const Duration(milliseconds: 500), () {
            //       AppNavigation.toNamed(Routes.changePassword);
            //     });
            //   },
            // );
          },
        );
      },
    );
  }
}

String _handleDuration(Duration myDuration) {
  //output minut : seconds
  int durationInMinute = myDuration.inMinutes;
  int durationInSeconds = myDuration.inSeconds;

  durationInSeconds = durationInSeconds - (durationInMinute * 60);
  if (durationInSeconds < 10) return "0$durationInMinute:0$durationInSeconds";
  return "0$durationInMinute:$durationInSeconds";
}
