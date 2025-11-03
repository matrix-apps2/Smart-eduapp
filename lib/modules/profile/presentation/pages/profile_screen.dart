import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/profile/logic/profile_cubit.dart';
import '../../../../modules/profile/presentation/pages/profile_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return const ProfileView(profileModel: null);
          if (state.state == BaseState.initial) {
            context.read<ProfileCubit>().getProfile();
          }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () {
                context.read<ProfileCubit>().getProfile();
              },
            );
          }
          if (state.state == BaseState.loaded) {
            return ProfileView(profileModel: state.profileModel!);
          }
          return Container();
        },
      ),
    );
  }
}
