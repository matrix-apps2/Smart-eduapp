import '../../../../app.dart';
import '../../../../awesome_extension_package/awesome_extensions.dart';
import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/app_text.dart';
import '../../../../generated/assets.dart';
import '../../../../modules/home/presentation/cubit/home_cubit.dart';
import '../../../../modules/notification/logic/notification_count/notification_count_cubit.dart';
import '../../../../utils/resources/values_manager.dart';
import '../../../../utils/routes/app_routes.dart';
import '../../../../utils/routes/navigation_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isRefreshing = false;
  bool canRefresh = false;
  @override
  initState() {
    super.initState();

    //listen to refresh scroll
    _scrollController.addListener(() {
      //on drag top to bottom
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_scrollController.position.pixels == 0) {
          if (!isRefreshing) {
            canRefresh = true;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }

  _homeAppBar() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText("Welcome Back", pv: 0),
            AppText(
              globalUser?.name ?? "N/A",
              color: Colors.black,
              pv: 0,
            ).header(),
          ],
        ).paddingSymmetric(horizontal: 12),
        const Spacer(),
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          icon: BlocBuilder<NotificationCountCubit, NotificationCountState>(
            builder: (context, state) {
              int? notificationCount = state.data?.setting.notificationCount;
              return Badge(
                  label: notificationCount! > 0
                      ? Text("$notificationCount")
                      : null,
                  isLabelVisible: notificationCount > 0,
                  child: FaIcon(
                    FontAwesomeIcons.bell,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ));
            },
          ),
          onPressed: () {
            context.read<NotificationCountCubit>().resetNotificationCount();
            AppNavigation.toNamed(Routes.notificationScreen);
          },
        ),
        if (kDebugMode)
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            icon: const FaIcon(FontAwesomeIcons.bug, size: 20),
            onPressed: () {
              AppNavigation.toNamed(Routes.testScreen);
            },
          ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  final ScrollController scrollController;
  const HomeView(this.scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [],
      ),
    );
  }

  Widget _requiredToSubscribeAccountView() {
    return Column(
      children: [
        Image.asset(Assets.assetsImagesImCoins,
            width: deviceHeight / 2.2, height: deviceHeight / 2.2),
        const AppText("congrats ! , Your account has been accepted")
            .header()
            .bold(),
        const SizedBox(height: 24),
      ],
    );
  }
}
