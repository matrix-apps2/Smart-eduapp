import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/contact_us/logic/contact_us/contact_us_cubit.dart';
import '../../../../modules/contact_us/presentation/contact_us_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings().support, isBackButtonExist: false),
      body: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          return const ContactUsView();
          if (state.state == BaseState.initial) {
            context.read<ContactUsCubit>().getContactUs();
          }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () {
                context.read<ContactUsCubit>().getContactUs();
              },
            );
          }
          if (state.state == BaseState.loaded) {
            return const ContactUsView();
          }
          return Container();
        },
      ),
    );
  }
}
