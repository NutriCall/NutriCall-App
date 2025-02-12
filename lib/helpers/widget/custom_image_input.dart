import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({super.key});
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
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await requestPermission();
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.camera),
                      title: const Text("Ambil dari Kamera"),
                      onTap: () async {
                        Navigator.pop(context);
                        await pickImage(ImageSource.camera);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.photo),
                      title: const Text("Pilih dari Galeri"),
                      onTap: () async {
                        Navigator.pop(context);
                        await pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.darkGreen, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Add Image +',
                style: TextStyle(color: AppColor.darkGreen, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
