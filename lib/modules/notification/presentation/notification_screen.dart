import '../../../../modules/notification/presentation/widget/empty_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base/base_states.dart';
import '../../../../utils/translations/strings.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/notification/logic/notification/notification_cubit.dart';
import '../../../../modules/notification/presentation/notification_view.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  initState() {
    super.initState();
    context.read<NotificationCubit>().getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings().notifications,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state.state == BaseState.initial) {
            context.read<NotificationCubit>().getNotification();
          }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () {
                context.read<NotificationCubit>().getNotification();
              },
            );
          }
          if (state.state == BaseState.loaded) {
            if (state.data.isEmpty) {
              return const EmptyNotifications();
            }
            // return const EmptyNotifications();

            return NotificationView(notifications: state.data);
          }
          return Container();
        },
      ),
    );
  }
}
