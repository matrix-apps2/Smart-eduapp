import '../../../../core/base/base_states.dart';
import '../../../../core/presentation/widgets/component/custom_app_bar.dart';
import '../../../../core/presentation/widgets/component/error_layout.dart';
import '../../../../core/presentation/widgets/custom_loading_spinner.dart';
import '../../../../modules/packages/logic/packages/packages_cubit.dart';
import '../../../../modules/packages/presentation/packages_view.dart';
import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  @override
  initState() {
    super.initState();
    context.read<PackagesCubit>().getPackages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings().packages,
      ),
      body: BlocBuilder<PackagesCubit, PackagesState>(
        builder: (context, state) {
          if (state.state == BaseState.initial) {
            context.read<PackagesCubit>().getPackages();
          }
          if (state.state == BaseState.loading) {
            return const Center(child: CustomLoadingSpinner());
          }
          if (state.state == BaseState.error) {
            return ErrorView(
              errorModel: state.error,
              onRetry: () {
                context.read<PackagesCubit>().getPackages();
              },
            );
          }
          if (state.state == BaseState.loaded) {
            return PackagesView(list: state.data);
          }
          return Container();
        },
      ),
    );
  }
}
