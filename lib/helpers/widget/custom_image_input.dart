import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomImagePicker extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomImagePicker({super.key, this.onTap});

  Future<void> requestPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    PermissionStatus galleryStatus = await Permission.photos.request();

    if (cameraStatus.isGranted && galleryStatus.isGranted) {
      print("Izin diberikan");
    } else {
      print("Izin ditolak");
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      print("Gambar dipilih: ${image.path}");
    } else {
      print("Tidak ada gambar yang dipilih");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image",
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColor.semiBlack,
            fontWeight: FontWeight.w500
          ),
        ),
        const Gap(6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.darkGreen, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Add Image +',
                style: GoogleFonts.poppins(
                  fontSize: 15, 
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreen
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

