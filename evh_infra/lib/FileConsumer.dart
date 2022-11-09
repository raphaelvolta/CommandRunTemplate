import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

import 'domain/component_loader.dart';

class FileConsumer{
  Future<ComponentLoader> openFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    late ComponentLoader result;
    if (filePickerResult != null) {
      PlatformFile file = filePickerResult.files.first;
      String content = readFileContent(file.path!);
      result = ComponentLoader.fromJson(jsonDecode(content));
    } else {
      print("User canceled operation");
      result = ComponentLoader(components: List.empty());
    }
    return result;
  }

  String readFileContent(String path){
    return File(path).readAsStringSync();
  }
}