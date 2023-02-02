import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sys_paths;
import 'package:cloudinary_sdk/cloudinary_sdk.dart';

import 'show_snack_bar_msg.dart';
import '../settings/constants.dart';
import '../services/cloudinary_services.dart';
import '../providers/electric_bills.dart';

class ImageInput extends StatefulWidget {
  final   String id;
  final   String imageUrl;

  const ImageInput({required this.id, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  bool _isLoading = false;
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
    final appDir = await sys_paths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');

    setState(() {
      _isLoading = true;
    });
    // ----- cloudinary
    CloudinaryServices cloudinaryServices = CloudinaryServices();
    CloudinaryResponse response =
        await cloudinaryServices.uploadFile(savedImage, widget.id);
    // ----- cloudinary
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
          ShowSnackBarMsg.showSnackBarMsg(context,'Image upload success', Colors.green);
        } else {
          if (kDebugMode) {
            print('Adding error occurred');
          }
        }
        return value;
      });
    }
    setState(() {
      _isLoading = false;
    });
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
          child: !_isLoading
              ? TextButton.icon(
                  onPressed: _takePicture,
                  icon: const Icon(Icons.camera),
                  label: Text(
                    'Take a picture',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : TextButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.hourglass_bottom),
                  label: const Text(
                    'Uploading...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
