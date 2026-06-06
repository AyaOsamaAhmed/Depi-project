import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImagePicker extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;
  final VoidCallback? onPickImage;

  const ProfileImagePicker({
    super.key,
    this.imageUrl,
    this.imageFile,
    this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 80.r,
            backgroundImage: imageFile != null
                ? FileImage(imageFile!)
                : (imageUrl != null && imageUrl!.isNotEmpty)
                    ? NetworkImage(imageUrl!)
                    : null,
            backgroundColor: context.theme.disabledColor.withOpacity(0.1),
            child: (imageFile == null && (imageUrl == null || imageUrl!.isEmpty))
                ? Icon(
                    Icons.person,
                    size: 80.r,
                    color: context.theme.disabledColor,
                  )
                : null,
          ),
          Positioned(
            bottom: 5.h,
            right: 5.w,
            child: GestureDetector(
              onTap: onPickImage,
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.w),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
