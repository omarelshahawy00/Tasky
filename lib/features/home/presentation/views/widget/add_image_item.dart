import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';

class AddImageItem extends StatefulWidget {
  final Function(File?) onImageSelected; // Callback to return selected image

  const AddImageItem({super.key, required this.onImageSelected});

  @override
  _AddImageItemState createState() => _AddImageItemState();
}

class _AddImageItemState extends State<AddImageItem> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    color: ColorsManager.appPrimaryColor,
                  ),
                  title: Text("Take a photo"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    color: ColorsManager.appPrimaryColor,
                  ),
                  title: Text("Choose from gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showImagePickerOptions,
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.appPrimaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child:
            _selectedImage == null
                ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        color: ColorsManager.appPrimaryColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Add Img",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorsManager.appPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                )
                : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    _selectedImage!,
                    width: double.infinity,
      
                    fit: BoxFit.fill,
                  ),
                ),
      ),
    );
  }
}
