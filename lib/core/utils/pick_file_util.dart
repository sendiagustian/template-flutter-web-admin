import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PickFileUtil {
  File bytesToFile(PlatformFile platformFile) {
    return File.fromRawPath(platformFile.bytes!);
  }

  String getFileType(PlatformFile platformFile) {
    int index = platformFile.name.split(".").length - 1;
    return platformFile.name.split(".")[index];
  }

  String getFileName(PlatformFile platformFile) {
    return platformFile.name.split(".")[0].replaceAll(" ", "_");
  }

  Future<PlatformFile?> pickSingleFile({
    required FileType type,
    List<String>? customExtensionFile,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type,
        allowedExtensions: customExtensionFile,
      );

      if (result == null) {
        return null;
      } else {
        PlatformFile file = result.files.single;
        return file;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<PlatformFile?>> pickMultiFile({
    required FileType type,
    List<String>? customExtensionFile,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: true,
        allowedExtensions: customExtensionFile,
      );

      if (result != null) {
        List<PlatformFile> files = result.files;
        return files;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
