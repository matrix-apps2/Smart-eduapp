import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/faq/logic/faq/faq_cubit.dart';
import '../../../../modules/faq/presentation/faq_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  initState() {
    super.initState();
    context.read<FaqCubit>().getFaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings().faq,
      ),
      body: BlocBuilder<FaqCubit, FaqState>(
        builder: (context, state) {
          if (state.state == BaseState.initial) {
            context.read<FaqCubit>().getFaq();
          }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () {
                context.read<FaqCubit>().getFaq();
              },
            );
          }
          if (state.state == BaseState.loaded) {
            return FaqView(list: state.data);
          }
          return Container();
        },
      ),
    );
  }
}
