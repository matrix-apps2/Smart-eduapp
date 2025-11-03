import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/about/logic/about/about_cubit.dart';
import '../../../../modules/about/presentation/about_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  initState() {
    super.initState();
    context.read<AboutCubit>().getAbout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings().about,
      ),
      body: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          // if (state.state == BaseState.initial) {
          //   context.read<AboutCubit>().getAbout();
          // }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () => context.read<AboutCubit>().getAbout(),
            );
          }
          if (state.state == BaseState.loaded) {
            return AboutView(desc: state.data?.description ?? "");
          }
          return Container();
        },
      ),
    );
  }
}
