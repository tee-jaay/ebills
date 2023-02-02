import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class CloudinaryServices {
  final String _cloudName = dotenv.get("cloudinaryCloudName");
  final String _apiKey = dotenv.get("cloudinaryApiKey");
  final String _apiSecret = dotenv.get("cloudinaryApiSecret");

  Future<CloudinaryResponse> uploadFile(
      File savedImage, String fileName) async {
    final Cloudinary cloudinaryClient = Cloudinary.full(
      cloudName: _cloudName,
      apiKey: _apiKey,
      apiSecret: _apiSecret,
    );

    final response =
        await cloudinaryClient.uploadResource(CloudinaryUploadResource(
            filePath: savedImage.path,
            fileBytes: savedImage.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
            folder: 'utilityBillsApp/electric-bills',
            fileName: fileName,
            progressCallback: (count, total) {
              if (kDebugMode) {
                print('Uploading image from file with progress: $count/$total');
              }
            }));
    return response;
  }
}
