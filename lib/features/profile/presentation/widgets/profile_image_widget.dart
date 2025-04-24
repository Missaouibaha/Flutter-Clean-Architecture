import 'dart:io';

import 'package:clean_arch_app/core/theming/colors.dart';
import 'package:clean_arch_app/core/utils/app_assets.dart';
import 'package:clean_arch_app/core/utils/app_dimensions.dart';
import 'package:clean_arch_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: _showImagePickerDialog,
          child: CircleAvatar(
            backgroundColor: ColorManager.white,
            radius: AppDimensions.radius_60,
            foregroundImage:
                _imageFile != null
                    ? FileImage(_imageFile!)
                    : AssetImage(AppAssets.iconUserAvatar) as ImageProvider,
          ),
        ),
        Positioned(
          right: -AppDimensions.padding_2,
          bottom: AppDimensions.padding_10,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: AppDimensions.radius_12,
            child: ImageIcon(AssetImage(AppAssets.iconEdit)),
          ),
        ),
      ],
    );
  }

  Future<void> _showImagePickerDialog() async {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text(AppStrings.gallery),
                  onTap: () async {
                    Navigator.pop(context);
                    final picked = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (picked != null) {
                      setState(() {
                        _imageFile = File(picked.path);
                      });
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text(AppStrings.camera),
                  onTap: () async {
                    Navigator.pop(context);
                    final picked = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                    );
                    if (picked != null) {
                      setState(() {
                        _imageFile = File(picked.path);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }
}
