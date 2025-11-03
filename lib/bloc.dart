import 'package:smart_operation/modules/guest/layout/layout_cubit/guest_layout_cubit.dart';

import '../../../../core/services/services_locator.dart';
import 'modules/about/logic/about/about_cubit.dart';
import 'modules/auth/logic/login/login_cubit.dart';
import 'modules/auth/logic/password/password_cubit.dart';
import 'modules/auth/logic/register/register_cubit.dart';
import 'modules/auth/logic/verify_account/verify_account_cubit.dart';
import 'modules/contact_us/logic/contact_us/contact_us_cubit.dart';
import 'modules/faq/logic/faq/faq_cubit.dart';
import 'modules/home/presentation/cubit/home_cubit.dart';
import 'modules/layout/layout/layout_cubit.dart';
import 'modules/location/logic/location_city/city_cubit.dart';
import 'modules/location/logic/location_country/country_cubit.dart';
import 'modules/location/logic/location_region/region_cubit.dart';
import 'modules/notification/logic/notification/notification_cubit.dart';
import 'modules/notification/logic/notification_count/notification_count_cubit.dart';
import 'modules/packages/logic/packages/packages_cubit.dart';
import 'modules/policy/logic/policy/policy_cubit.dart';
import 'modules/profile/logic/profile_cubit.dart';
import 'modules/setting/presentation/cubit/setting_cubit.dart';
import 'modules/splash/cubit/splash_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;

  const GenerateMultiBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingCubit>(
            create: (context) => SettingCubit(getIt())..getCurrentTheme()),
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
        BlocProvider<GuestLayoutCubit>(create: (context) => GuestLayoutCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),

        //* Auth
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(loginUseCase: getIt())),
        BlocProvider<PasswordCubit>(
            create: (context) => PasswordCubit(getIt(), getIt(), getIt())),
        BlocProvider(create: (context) => RegisterCubit(getIt())),
        BlocProvider(create: (context) => VerifyAccountCubit(getIt(), getIt())),

        //* Profile
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit(getIt())),

        //* Notification
        BlocProvider(create: (context) => NotificationCubit(getIt())),
        BlocProvider(create: (context) => NotificationCountCubit(getIt())),

        BlocProvider(create: (context) => ContactUsCubit(getIt())),
        BlocProvider(create: (context) => FaqCubit(getIt())),
        BlocProvider(create: (context) => AboutCubit(getIt())),
        BlocProvider(create: (context) => PolicyCubit(getIt())),

        //* Packages & Invoices
        BlocProvider(create: (context) => PackagesCubit(getIt())),

        //* Location
        BlocProvider(create: (context) => CountryCubit(getIt())),
        BlocProvider(create: (context) => CityCubit(getIt())),
        BlocProvider(create: (context) => RegionCubit(getIt())),
      ],
      child: child,
    );
  }
}
