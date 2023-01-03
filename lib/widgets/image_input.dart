import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;
import 'package:cloudinary_sdk/cloudinary_sdk.dart';

import '../settings/constants.dart';
import '../providers/electric_bills.dart';

class ImageInput extends StatefulWidget {
  String id;
  String imageUrl;

  ImageInput({required this.id, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  late String _imageUrl = widget.imageUrl;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await sysPaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');

    // ----- cloudinary
    String cloudName = dotenv.get("cloudinaryCloudName");
    String apiKey = dotenv.get("cloudinaryApiKey");
    String apiSecret = dotenv.get("cloudinaryApiSecret");
    final Cloudinary _cloudinaryClient = Cloudinary.full(
      cloudName: cloudName,
      apiKey: apiKey,
      apiSecret: apiSecret,
    );

    final response =
        await _cloudinaryClient.uploadResource(CloudinaryUploadResource(
            filePath: savedImage.path,
            fileBytes: savedImage.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
            folder: 'utilityBillsApp/electric-bills',
            fileName: widget.id,
            progressCallback: (count, total) {
              print('Uploading image from file with progress: $count/$total');
            }));

    if (response.isSuccessful) {
      String? imageUrl = response.secureUrl;
      setState(() {
        _imageUrl = imageUrl!;
      });
      dynamic selectedElectricBill = {
        "imageUrl": imageUrl,
      };

      ElectricBills electricBills = ElectricBills();
      electricBills
          .updateElectricBill(widget.id, selectedElectricBill)
          .then((value) {
        if (value == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
              'Image upload success',
              style: TextStyle(color: Colors.greenAccent),
            )),
          );
        } else {
          print('Adding error occurred');
        }
        return value;
      });
    }
    // ----- cloudinary
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _imageUrl.isEmpty
              ? const Text('No image')
              : Image.network(
                  // widget.imageUrl,
                  _imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          width: spaceSmall,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: Text(
              'Take a picture',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
