import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/policy/logic/policy/policy_cubit.dart';
import '../../../../modules/policy/presentation/policy_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  initState() {
    super.initState();
    context.read<PolicyCubit>().getPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings().policyAndTerms,
      ),
      body: BlocBuilder<PolicyCubit, PolicyState>(
        builder: (context, state) {
          if (state.state == BaseState.initial) {
            context.read<PolicyCubit>().getPolicy();
          }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () {
                context.read<PolicyCubit>().getPolicy();
              },
            );
          }
          if (state.state == BaseState.loaded) {
            return PolicyView(desc: state.data?.content ?? "");
          }
          return Container();
        },
      ),
    );
  }
}
