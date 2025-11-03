import '../core/presentation/widgets/app_text.dart';
import '../core/presentation/widgets/component/component.dart';
import '../core/presentation/widgets/component/inputs/edit_text.dart';
import '../utils/resources/resources.dart';
import '../utils/routes/navigation_services.dart';
import '../utils/translations/strings.dart';
import 'package:flutter/material.dart';

class AppBottomSheets {
  showAddTeamBottomSheet({
    required BuildContext context,
    required String title,
    required Function onTap,
  }) {
    TextEditingController controller = TextEditingController();
    showModalBottomSheet(
      isScrollControlled: true,
      builder: (context) {
        bool loading = false;
        return Material(
            color: Colors.transparent,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      children: [
                        Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 40),
                              EditText(hint: title, controller: controller),
                              const SizedBox(height: 16),
                              AppButton(
                                  onTap: () async {
                                    loading = true;
                                    setState(() {});
                                    await onTap(controller.text);
                                    loading = false;
                                    setState(() {});
                                    AppNavigation.goBack();
                                  },
                                  title: Strings().add,
                                  loading: loading),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 8,
                          child: GestureDetector(
                            onTap: () {
                              AppNavigation.goBack();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.close),
                            ),
                          ),
                        )
                      ],
                    ));
              },
            ));
      },
      context: context,
    );
  }

  show({
    required BuildContext context,
    required Function onFinishedCallback,
    required Widget child,
    bool dynamicHeight = true,
    double? height,
  }) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        double? sheetHeight = height;
        sheetHeight ??= dynamicHeight ? null : deviceHeight * 0.85;
        return SizedBox(
          height: sheetHeight,
          child: Material(
            color: Colors.transparent,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            child: child,
          ),
        );
      },
      context: context,
    );
    onFinishedCallback();
  }

  selectWidget({
    required BuildContext context,
    required List<Widget> list,
    required String? title,
    String? desc,
  }) async {
    Widget? selected;

    await showModalBottomSheet(
      context: context,
      builder: (context) => Material(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shrinkWrap: true,
            children: [
              if (title != null) AppText(title).header(),
              if (desc != null) AppText(desc).footer(),
              ...list,
            ],
          ),
        ),
      ),
    );

    // await Dialogs.materialDialog(
    //     msg: Strings().selectImageType,
    //     color: Colors.white,
    //     context: AppNavigation.navigationKey.currentContext!,
    //     customViewPosition: CustomViewPosition.AFTER_ACTION,
    //     customView: ListView.builder(
    //       shrinkWrap: true,
    //       itemCount: list.length,
    //       itemBuilder: (context, index) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 12),
    //           child: list[index],
    //         );
    //       },
    //     ));
    return selected;
  }
}
