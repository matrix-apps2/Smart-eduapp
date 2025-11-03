import 'dart:io';

import 'package:path/path.dart' as pathPk;
import 'package:path_provider/path_provider.dart';

class CustomPath {
  String folderName = "qkw";
  Future<String> getPath({String? databaseName}) async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    if (databaseName == null) return '${documentsDirectory.path}/$folderName';
    String path =
        pathPk.join('${documentsDirectory.path}/$folderName', databaseName);
    return path;
  }
}
