import 'dart:io';

import 'package:smart_operation/modules/guest/layout/presentation/pages/guest_layout_screen.dart';

import '../../../modules/about/presentation/about_screen.dart';
import '../../../modules/auth/presentation/pages/change_password_screen.dart';
import '../../../modules/auth/presentation/pages/forget_password_screen.dart';
import '../../../modules/auth/presentation/pages/login_screen.dart';
import '../../../modules/auth/presentation/pages/otp_screen.dart';
import '../../../modules/auth/presentation/pages/register_screen.dart';
import '../../../modules/faq/presentation/faq_screen.dart';
import '../../../modules/layout/presentation/pages/layout_screen.dart';
import '../../../modules/notification/presentation/notification_screen.dart';
import '../../../modules/packages/presentation/packages_screen.dart';
import '../../../modules/policy/presentation/policy_screen.dart';
import '../../../modules/profile/presentation/pages/profile_screen.dart';
import '../../../modules/setting/presentation/pages/setting_screen.dart';
import '../../../modules/splash/select_lang_screen.dart';
import '../../../modules/splash/splash_screen.dart';
import '../../../modules/test_screen/views/test_screen.dart';
import '../../../modules/update/view/update_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/presentation/widgets/getLocationFromMap.dart';
import '../../modules/auth/presentation/pages/complete_profile.dart';
import '../../modules/auth/presentation/pages/preferences.dart';
import '../../modules/auth/presentation/pages/successful_screen.dart';
import '../../modules/chat/presentation/pages/add_chat_view.dart';
import '../../modules/chat/presentation/pages/chat_screen.dart';
import '../../modules/contact_us/presentation/contact_us_screen.dart';
import '../../modules/guest/blogs/pages/blog_details_screen.dart';
import '../../modules/guest/home/pages/request_free_consultant.dart';
import '../../modules/guest/more/pages/about_us_screen.dart';
import '../../modules/guest/more/pages/terms_and_conditions_screen.dart';
import '../../modules/guest/portoflio/pages/portfolio_screen.dart';
import '../../modules/guest/portoflio/pages/work_title_screen.dart';
import '../../modules/guest/services/pages/service_details_screen.dart';
import '../../modules/guest/services/pages/service_request_screen.dart';
import '../../modules/guest/services/pages/services_screen.dart';
import '../../modules/onboarding/presentation/onboarding_screen.dart';
import '../../modules/rating/presentation/pages/raring_overview_screen.dart';
import '../../modules/task_details/presentation/pages/task_details_screen.dart';
import 'app_routes.dart';
import 'undefined_route_screen.dart';

// GoRouter configuration

class AppPages {
  static Route generateRoute(RouteSettings settings) {
    String path = settings.name ?? '';
    Widget page = unknownRoutePage(path).page;
    if (path.isEmpty) return unknownRoutePage(path).page as Route;

    //* Auth
    if (path == Routes.selectLanguageScreen) {
      page = const SelectLanguageScreen();
    }
    if (path == Routes.otp) {
      Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
      if (data['phone'].isEmpty || data['phoneCountryId'].isEmpty) {
        page = unknownRoutePage(path).page;
      } else {
        page = OtpScreen(
          phone: data['phone'],
          sendOtp: data['sendOtp'] == 'true',
          phoneCountryId: data['phoneCountryId'],
          otp: data['otp'] ?? '',
          isForgetPassword: data['isForgetPassword'] == 'true',
        );
      }
    }
    if (path == Routes.forgetPasswordScreen) {
      page = const ForgetPasswordScreen();
    }
    if (path == Routes.loginScreen) page = const LoginScreen();
    if (path == Routes.registerScreen) page = const RegisterScreen();
    if (path == Routes.completeProfile) page = const CompleteProfile();
    if (path == Routes.successfulScreen) {
      Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
      page = SuccessfulScreen(isResetPassword: data['isResetPassword'],);
    }
    if (path == Routes.preferences) page = const Preferences();
    if (path == Routes.changePassword) page = const ChangePasswordScreen();
    if (path == Routes.profileScreen) page = const ProfileScreen();

    if (path == Routes.layout) page = const LayoutScreen(currentPage: 0);
    if (path == Routes.guestLayout) page = const GuestLayoutScreen(currentPage: 0);

    //* Others
    if (path == Routes.updateScreen) page = const UpdateScreen();
    if (path == Routes.testScreen) page = const TestScreen();
    if (path == Routes.taskDetailsScreen) page = const TaskDetailsScreen();
    // if (path == Routes.splahScreen) page = const LayoutScreen(currentPage: 0);
    if (path == Routes.splahScreen) page = const SplashScreen();
    if (path == Routes.onboardingScreen) page = OnboardingScreen();
    if (path == Routes.settingsScreen) page = const SettingScreen();
    if (path == Routes.chatsScreen) page = ChatsScreen();
    if (path == Routes.addChatView) page = AddChatView();
    if (path == Routes.notificationScreen) page = const NotificationScreen();
    if (path == Routes.ratingOverviewScreen) page = RatingOverviewScreen();
    if (path == Routes.requestFreeConsultant) page = RequestFreeConsultant();
    if (path == Routes.servicesScreen) page = ServicesScreen();
    if (path == Routes.serviceDetailsScreen) page = ServiceDetailsScreen();
    if (path == Routes.serviceRequestScreen) page = ServiceRequestScreen();
    if (path == Routes.portfolioScreen) page = PortfolioScreen();
    if (path == Routes.workTitleScreen) page = WorkTitleScreen();
    if (path == Routes.blogDetailsScreen) page = BlogDetailsScreen();
    if (path == Routes.aboutUsScreen) page = AboutUsScreen();
    if (path == Routes.contactUsScreen) page = ContactUsScreen();
    if (path == Routes.termsAndConditionsScreen) page = TermsAndConditionsScreen();

    //package & invoice
    if (path == Routes.packages) page = const PackagesScreen();

    //common
    if (path == Routes.faq) page = const FaqScreen();
    if (path == Routes.about) page = const AboutScreen();
    if (path == Routes.policy) page = const PolicyScreen();

    //map
    if (path == Routes.getLocationFromMap) {
      Map<String, dynamic> data = settings.arguments as Map<String, dynamic>;
      page = GetLocationFromMapScreen(
        lat: data["lat"],
        lng: data["lng"],
      );
    }

    return Platform.isAndroid
        ? MaterialPageRoute(builder: (_) => page, settings: settings)
        : CupertinoPageRoute(builder: (_) => page, settings: settings);
  }

  static AppPage unknownRoutePage(String path) {
    return AppPage(
      path: '/404',
      page: UndefinedRouteScreen(path: path),
    );
  }

  static AppPage errRoutePage(String path) {
    return AppPage(
      path: '/500',
      page: UndefinedRouteScreen(path: path),
    );
  }
}

class AppPage {
  final String path;
  final Widget page;

  AppPage({required this.path, required this.page});
}
