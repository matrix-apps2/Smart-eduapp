import 'dart:io';

import '../core/presentation/widgets/app_text.dart';
import '../utils/routes/navigation_services.dart';
import '../utils/translations/strings.dart';
import '../widgets/app_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class AppDialogs {
  Future<File?> pickImage(BuildContext context) async {
    File? file;
    await Dialogs.materialDialog(
        msg: Strings().selectImageSource,
        color: Colors.white,
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () async {
              XFile? pickedFile = await (ImagePicker()
                  .pickImage(source: ImageSource.camera, imageQuality: 33));
              if (pickedFile != null) {
                file = File(pickedFile.path);
                AppNavigation.goBack();
              }
            },
            text: Strings().camera,
            iconData: Icons.camera_alt,
            textStyle: TextStyle(color: Theme.of(context).primaryColor),
            iconColor: Theme.of(context).primaryColor,
          ),
          IconsOutlineButton(
            onPressed: () async {
              XFile? pickedFile = await (ImagePicker()
                  .pickImage(source: ImageSource.gallery, imageQuality: 33));
              if (pickedFile != null) {
                file = File(pickedFile.path);
                AppNavigation.goBack();
              }
            },
            text: Strings().gallery,
            iconData: Icons.photo_library,
            textStyle: TextStyle(color: Theme.of(context).primaryColor),
            iconColor: Theme.of(context).primaryColor,
          ),
        ]);
    return file;
  }

  Future<bool> confirmDelete(BuildContext context) async {
    bool? result;
    await Dialogs.materialDialog(
      msg: Strings().confirmDelete,
      color: Colors.white,
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
            result = true;
            AppNavigation.goBack();
          },
          text: Strings().yes,
          iconData: Icons.check,
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
          iconColor: Theme.of(context).primaryColor,
        ),
        IconsOutlineButton(
          onPressed: () {
            result = false;
            AppNavigation.goBack();
          },
          text: Strings().no,
          iconData: Icons.close,
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
          iconColor: Theme.of(context).primaryColor,
        ),
      ],
    );
    return result ?? false;
  }

  selectWidget({
    required BuildContext context,
    required List<Widget> list,
    required String? title,
    String? desc,
  }) async {
    Widget? selected;

    await showDialog(
      context: context,
      builder: (context) => Dialog(
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

  showView({required BuildContext context, required Widget view}) async {
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 0,
        child: view,
      ),
    );
  }

  Future<bool?> showDeleteAccountDialog(BuildContext context) async {
    bool? result;
    await Dialogs.materialDialog(
      msg: Strings().confirmDeleteAccount,
      color: Colors.white,
      context: context,
      actions: [
        IconsOutlineButton(
          onPressed: () {
            result = true;
            AppNavigation.goBack();
          },
          text: Strings().yes,
          iconData: Icons.check,
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
          iconColor: Theme.of(context).primaryColor,
        ),
        IconsOutlineButton(
          onPressed: () {
            AppNavigation.goBack();
          },
          text: Strings().no,
          iconData: Icons.close,
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
          iconColor: Theme.of(context).primaryColor,
        ),
      ],
    );
    return result;
  }

  Future<bool> question(
    BuildContext context, {
    required String question,
    required String yes,
    required String no,
  }) async {
    bool resulst = false;
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(question),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Spacer(),
                  AppChip2(
                    title: yes,
                    icon: FontAwesomeIcons.check,
                    onTap: () {
                      resulst = true;
                      AppNavigation.goBack();
                    },
                  ),
                  const Spacer(),
                  AppChip2(
                    title: no,
                    icon: FontAwesomeIcons.xmark,
                    textColor: Colors.red,
                    onTap: () {
                      resulst = false;
                      AppNavigation.goBack();
                    },
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
    return resulst;
  }

  void yesNo(
      {required BuildContext context,
      required String title,
      required String desc,
      required Function() onYes}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(title).header(),
              AppText(desc).footer(),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Spacer(),
                  AppChip2(
                    title: Strings().yes,
                    icon: FontAwesomeIcons.check,
                    onTap: () {
                      onYes();
                      AppNavigation.goBack();
                    },
                  ),
                  const Spacer(),
                  AppChip2(
                    title: Strings().no,
                    icon: FontAwesomeIcons.xmark,
                    textColor: Colors.red,
                    onTap: () {
                      AppNavigation.goBack();
                    },
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
