// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';

// import 'pick_file_util.dart';

// class FirebaseStorageUtil {
//   FirebaseStorage storage = FirebaseStorage.instance;

//   static final PickFileUtil _fileUtil = PickFileUtil();

//   Future<String?> uploadFile(PlatformFile file, String destinationPath) async {
//     String? imgUrl;
//     String fileName = "${_fileUtil.getFileName(file)}.${_fileUtil.getFileType(file)}";
//     Reference ref = storage.ref().child(destinationPath).child(fileName);

//     try {
//       UploadTask uploadTask = ref.putData(file.bytes!);
//       imgUrl = await (await uploadTask).ref.getDownloadURL();
//       return imgUrl;
//     } catch (e) {
//       debugPrint(e.toString());
//       return imgUrl;
//     }
//   }

//   // Future<File?> downloadAndConvertToXFile(String imageUrl) async {
//   //   try {
//   //     String image = imageUrl.split('?')[0];
//   //     // Mendapatkan referensi dari Firebase Storage
//   //     Reference ref = storage.refFromURL(image);

//   //     // Mendownload gambar dari Firebase Storage
//   //     final Directory tempDir = await getTemporaryDirectory();
//   //     final File tempFile = File('${tempDir.path}/${path.basename(image)}');
//   //     await ref.writeToFile(tempFile);

//   //     // Mengonversi File ke XFile
//   //     return File(tempFile.path);
//   //   } catch (e) {
//   //     debugPrint('Error downloading image: $e');
//   //     return null;
//   //   }
//   // }

//   Future<void> deleteFileByUrlToken(String path) async {
//     try {
//       await storage.ref().child(path).delete();
//     } on FirebaseException catch (e) {
//       debugPrint(e.message);
//     }
//   }
// }
