import '../../../../utils/translations/strings.dart';
import 'package:flutter/material.dart';

import 'base/simple_dialogs.dart';

Future<bool?> customDialogAccount(BuildContext context) async {
  SimpleDialogs.showQuestionDialog(
    context: context,
    title: Strings().wantToSignOut,
    onNo: () async {
      _onPress(context);
      return false;
    },
    onYes: () {
      return true;
    },
    description: '',
  );
  return false;
}

_onPress(BuildContext context) async {
/*
 ResponseModel responseModel= await Provider.of<LocalAuthProvider>(context, listen: false).deleteAccount();
    if (responseModel.isSuccess) {
      NavigationService.goBack();
      NavigationService.pushNamedAndRemoveUntil(Routes.loginScreen);
    }
*/
}
