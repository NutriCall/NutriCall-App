import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});
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
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(Assets.images.userProfile.path),
              backgroundColor: Colors.transparent,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.darkGreen,
                    width: 4.0,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightGreen,
                ),
                child: IconButton(
                  icon: const Icon(Icons.edit,
                      color: AppColor.darkGreen, size: 25),
                  onPressed: () async {
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
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
