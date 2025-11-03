import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_operation/awesome_extension_package/awesome_extensions.dart';
import 'package:smart_operation/widgets/text_required.dart';

import '../../../../core/base/base_states.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../core/presentation/widgets/component/component.dart';
import '../../../../core/presentation/widgets/component/inputs/edit_text.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/auth/logic/password/password_cubit.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import '../../../../utils/theme/appColors.dart';
import '../../../../utils/theme/appImages.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../widgets/app_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/screen_utils.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
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
              title: 'Reset Password',
            ),
            body: BlocListener<PasswordCubit, PasswordState>(
              listener: (context, state) {
                if (state.changePasswordState == BaseState.error) {
                  if (state.changePasswordError is ReadableFailure) {
                    ReadableFailure failure =
                        state.changePasswordError as ReadableFailure;
                    AppSnackbar.show(
                        context: context, message: failure.message);
                  } else {
                    AppSnackbar.show(
                        context: context,
                        message: Strings().somethingWentWrong);
                    Navigator.pop(context);
                  }
                }
              },
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText('Time to Set a New One!', fontWeight: FontWeight.w700, size: 17.sp, align: TextAlign.start,),
                    AppText('Enter your desired new password here.', size: 17.sp, align: TextAlign.start,),

                    32.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextRequired(
                            text:Strings().newPassword, text2: ' *',),
                        EditText(
                          hint: Strings().enterYourPassword,
                          controller: newPasswordController,
                          prefixImage: AppImagePath.pass,
                          // validateFunc: _validatePassword,
                        ).passwordType(),
                        20.heightBox,
                        TextRequired(
                          text:Strings().confirmNewPassword, text2: ' *',),
                        EditText(
                          hint: Strings().enterYourPassword,
                          controller: confirmNewPasswordController,
                          prefixImage: AppImagePath.pass,
                          // validateFunc: _validatePassword,
                        ).passwordType(),
                        const SizedBox(height: 20),
                      ],
                    ),
                    32.heightBox,
                    BlocBuilder<PasswordCubit, PasswordState>(
                      builder: (context, state) {
                        bool isLoading = false;
                        if (state.changePasswordState == BaseState.loading) {
                          isLoading = true;
                        } else if (state.changePasswordState ==
                            BaseState.loaded) {
                        } else {}
                        return AppButton(
                          title: Strings().submit,
                          loading: isLoading,
                          height: 40.h,
                          color: AppCustomColors.appPrimaryColor,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.black,
                          isRounded: false,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            AppNavigation.toNamed(Routes.successfulScreen, arguments: {
                              'isResetPassword' : true,
                            });

                            // BlocProvider.of<PasswordCubit>(context)
                            //     .changePassword(
                            //   context: context,
                            //   confirmPassword:
                            //       confirmNewPasswordController.text,
                            //   newPassword: newPasswordController.text,
                            // );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
