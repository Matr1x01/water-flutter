import 'dart:io';
import 'package:path_provider/path_provider.dart';

class SaveFile {
  Future<void> save(String filename, String content) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final path = '${appDocDir.path}/$filename';
    final file = File(path);
    await file.writeAsString(content);
  }
}
