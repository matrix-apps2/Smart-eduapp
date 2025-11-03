import '../../modules/auth/domain/usecases/password/forget_password_usecas.dart';
import '../../modules/auth/domain/usecases/password/reset_password_usecase.dart';
import '../../modules/auth/domain/usecases/verify_account/send_otp_usecase.dart';
import '../../modules/location/domain/usecases/cities_usecase.dart';
import '../../modules/location/domain/usecases/countries_usecase.dart';
import '../../modules/location/domain/repositories/location_repository.dart';
import '../../modules/location/data/repositories/location_repository_imp.dart';
import '../../../../core/base/base_network_call.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/storge/shared_pref/cache_consumer.dart';
import '../../modules/about/data/repositories/about_repository_imp.dart';
import '../../modules/about/domain/repositories/about_repository.dart';
import '../../modules/about/domain/usecases/about/about_usecase.dart';
import '../../modules/auth/data/repositories/auth_repositories_imp.dart';
import '../../modules/auth/domain/repositories/auth_repository.dart';
import '../../modules/auth/domain/usecases/login_usecase.dart';
import '../../modules/auth/domain/usecases/password/change_password_usecase.dart';
import '../../modules/auth/domain/usecases/register/register_usecase.dart';
import '../../modules/auth/domain/usecases/verify_account/verify_account_usecase.dart';
import '../../modules/contact_us/data/repositories/contact_us_repository_imp.dart';
import '../../modules/contact_us/domain/repositories/contact_us_repository.dart';
import '../../modules/contact_us/domain/usecases/contact_us/contact_us_usecase.dart';
import '../../modules/faq/data/repositories/faq_repository_imp.dart';
import '../../modules/faq/domain/repositories/faq_repository.dart';
import '../../modules/faq/domain/usecases/faq/faq_usecase.dart';
import '../../modules/layout/data/repositories/settings_repo_imp.dart';
import '../../modules/layout/domain/repositories/settings_repo.dart';
import '../../modules/layout/domain/usecases/device_info_usecase.dart';
import '../../modules/layout/domain/usecases/settings_usecase.dart';
import '../../modules/location/domain/usecases/regions_usecase.dart';
import '../../modules/notification/data/repositories/notification_repository_imp.dart';
import '../../modules/notification/domain/repositories/notification_repository.dart';
import '../../modules/notification/domain/usecases/notification/notification_mark_as_seen_usecase.dart';
import '../../modules/notification/domain/usecases/notification/notification_usecase.dart';
import '../../modules/notification/domain/usecases/notification_count/notification_count_usecase.dart';
import '../../modules/packages/data/repositories/packages_repository_imp.dart';
import '../../modules/packages/domain/repositories/packages_repository.dart';
import '../../modules/packages/domain/usecases/packages/packages_usecase.dart';
import '../../modules/policy/data/repositories/policy_repository_imp.dart';
import '../../modules/policy/domain/repositories/policy_repository.dart';
import '../../modules/policy/domain/usecases/policy/policy_usecase.dart';
import '../../modules/profile/data/repositories/profile_repository_imp.dart';
import '../../modules/profile/domain/repositories/profile_repository.dart';
import '../../modules/profile/domain/usecases/profile_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
Future<void> initInject() async {
  /// Repository
  // getIt.registerLazySingleton<LocalRepository>(
  // () => LocalRepositoryImp(dioClient: getIt(), cacheConsumer: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => AppPrefs());
  getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  // getIt.registerLazySingleton(
  //     () => AppSharedPref(secureStorage: getIt(), sharedPreferences: getIt()));

  getIt.registerLazySingleton<PrettyDioLogger>(
    () => PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true),
  );
  getIt
      .registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>(), getIt()));

  //Datasource
  getIt.registerLazySingleton<NetworkClient>(() => NetworkClient());

  //* User & Auth
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoriesImp(networkClient: getIt()));
  getIt.registerLazySingleton<SettingRepositories>(
      () => SettingRepositoryImp(networkClient: getIt()));

  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => DeviceInfoUseCase(getIt()));
  getIt.registerLazySingleton(() => SettingsUseCase(getIt()));
  getIt.registerLazySingleton(() => ChangePasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => ResetPasswordUseCase(getIt()));

  //* Profile
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImp(networkClient: getIt()));
  getIt.registerLazySingleton(() => ProfileUseCase(getIt()));

  //* Notification
  getIt.registerLazySingleton(() => NotificationUseCase(getIt()));
  getIt.registerLazySingleton<NotificationRepository>(
      () => NotificationRepositoryImp(networkClient: getIt()));
  getIt.registerLazySingleton(() => NotificationMarkAsSeenUseCase(getIt()));
  getIt.registerLazySingleton(() => NotificationCountUseCase(getIt()));

  //* Appointment

  //*Common
  getIt.registerLazySingleton(() => ContactUsUseCase(getIt()));
  getIt.registerLazySingleton<ContactUsRepository>(
      () => ContactUsRepositoryImp(networkClient: getIt()));
  getIt.registerLazySingleton(() => FaqUseCase(getIt()));
  getIt.registerLazySingleton<FaqRepository>(
      () => FaqRepositoryImp(networkClient: getIt()));
  getIt.registerLazySingleton(() => AboutUseCase(getIt()));
  getIt.registerLazySingleton<AboutRepository>(
      () => AboutRepositoryImp(networkClient: getIt()));
  getIt.registerLazySingleton(() => PolicyUseCase(getIt()));
  getIt.registerLazySingleton<PolicyRepository>(
      () => PolicyRepositoryImp(networkClient: getIt()));

  //* Packages & Invoices
  getIt.registerLazySingleton(() => PackagesUseCase(getIt()));
  getIt.registerLazySingleton<PackagesRepository>(
      () => PackagesRepositoryImp(networkClient: getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => VerifyAccountUseCase(getIt()));
  getIt.registerLazySingleton(() => SendOtpUseCase(getIt()));

  //* Location
  getIt.registerLazySingleton(() => CountriesUseCase(getIt()));
  getIt.registerLazySingleton(() => RegionsUseCase(getIt()));
  getIt.registerLazySingleton(() => CitiesUseCase(getIt()));
  getIt.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImp(networkClient: getIt()));
}
