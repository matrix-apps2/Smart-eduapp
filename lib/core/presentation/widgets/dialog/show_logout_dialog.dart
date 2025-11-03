import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';

import 'base/simple_dialogs.dart';

Future<bool?> customDialogLogout(BuildContext context) async {
  SimpleDialogs.showQuestionDialog(
    context: context,
    title: Strings().wantToSignOut,
    onNo: () async {
      _onLogoutPress(context);
      return false;
    },
    onYes: () {
      return true;
    },
    description: '',
  );
  return false;
}

_onLogoutPress(BuildContext context) {
/*  Provider.of<LocalAuthProvider>(context, listen: false)
      .logOut()
      .then((isCleared) {
    if (isCleared) {
      Navigator.pop(context);
      NavigationService.pushNamedAndRemoveUntil(Routes.loginScreen);
    }
  });*/
}
