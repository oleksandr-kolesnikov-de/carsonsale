/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<String> getPath() async {
    String path;
    if (kIsWeb) {
      path = "/assets/db";
      return path;
    } else {
      var dir = await getApplicationDocumentsDirectory();
      path = dir.path;
      return path;
    }
  }
}