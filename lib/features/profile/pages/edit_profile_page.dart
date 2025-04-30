import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/features/home/controllers/current_user_controllers.dart';
import 'package:nutri_call_app/features/profile/controllers/put_profile_controllers.dart';
import 'package:nutri_call_app/helpers/buttons/buttons.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/daily_activity_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/gender_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = useState<String?>(null);
    final selectedDailyActivity = useState<String?>(null);
    final pickedImage = useState<XFile?>(null);
    final fullNameController = useTextEditingController();
    final usernameController = useTextEditingController();
    final ageController = useTextEditingController();
    final weightController = useTextEditingController();
    final weightTargetController = useTextEditingController();
    final heightController = useTextEditingController();
    final bmiController = useTextEditingController();

    final postEditNotifier = ref.read(putProfileNotifierProvider.notifier);

    final isTouched = useState({
      'fullName': false,
      'username': false,
      'age': false,
      'weight': false,
      'weightTarget': false,
      'height': false,
    });

    final isButtonEnabled = useState(false);
    final isLoading = useState(false);

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
        pickedImage.value = image;
        print("Gambar dipilih: ${image.path}");
      } else {
        print("Tidak ada gambar yang dipilih");
      }
    }

    void showEditSuccessDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 27, vertical: 22),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: AppColor.lightGreen,
                  size: 70,
                ),
                const Gap(24),
                Text(
                  'your profile was successfully updated',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: AppColor.textColor2,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(24),
                Button.filled(
                  onPressed: () {
                    context.pushNamed(RouteName.main);
                  },
                  label: 'Ok',
                  color: AppColor.disabledGreen,
                ),
              ],
            ),
          );
        },
      );
    }

    void handleEdit() {
      if (!isButtonEnabled.value || isLoading.value) return;

      isLoading.value = true;
      final editParams = ProfileParams(
        imageUrl: pickedImage.value,
        fullName: fullNameController.text,
        username: usernameController.text,
        age: int.tryParse(ageController.text) ?? 0,
        weight: int.tryParse(weightController.text) ?? 0,
        weightTarget: int.tryParse(weightTargetController.text) ?? 0,
        height: int.tryParse(heightController.text) ?? 0,
        bmi: double.tryParse(bmiController.text) ?? 0.0,
        gender: selectedGender.value ?? '',
        fa: selectedDailyActivity.value ?? '',
      );

      postEditNotifier.fetch(
        params: editParams,
        onSuccess: (responseData) {
          isLoading.value = false;
          showEditSuccessDialog(context);
        },
        onFailed: (error) {
          isLoading.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("$error"), backgroundColor: AppColor.lightGreen),
          );
        },
      );
    }

    void validateInputs() {
      bool isValid = fullNameController.text.isNotEmpty &&
          usernameController.text.isNotEmpty &&
          ageController.text.isNotEmpty &&
          weightController.text.isNotEmpty &&
          heightController.text.isNotEmpty &&
          weightTargetController.text.isNotEmpty &&
          bmiController.text.isNotEmpty &&
          selectedDailyActivity.value != null &&
          selectedGender.value != null;

      isButtonEnabled.value = isValid;

      print("Button Enabled: $isButtonEnabled");
    }

    void calculateBMI() {
      final weight = double.tryParse(weightController.text);
      final heightCm = double.tryParse(heightController.text);
      final age = int.tryParse(ageController.text);

      if (weight != null && heightCm != null && age != null && age > 18) {
        final heightM = heightCm / 100;
        final bmi = weight / (heightM * heightM);
        bmiController.text = bmi.toStringAsFixed(2);
      } else {
        bmiController.clear();
      }
    }

    final userAsync = ref.watch(fetchCurrentUserNotifierProvider);

    useEffect(() {
      ageController.addListener(calculateBMI);
      weightController.addListener(calculateBMI);
      heightController.addListener(calculateBMI);
      fullNameController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'fullName': true};
      });
      usernameController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'username': true};
      });
      ageController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'age': true};
      });
      weightController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'weight': true};
      });
      weightTargetController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'weightTarget': true};
      });
      heightController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'height': true};
      });

      void dailyActivityListener() {
        print("Daily Activity Selected: ${selectedDailyActivity.value}");
        validateInputs();
      }

      void genderListener() {
        print("Gender Selected: ${selectedGender.value}");
        validateInputs();
      }

      selectedDailyActivity.addListener(dailyActivityListener);
      selectedGender.addListener(genderListener);
      userAsync.whenData((user) {
        if (user != null) {
          fullNameController.text = user.fullName ?? '';
          usernameController.text = user.username ?? '';
          ageController.text = user.age?.toString() ?? '';
          weightController.text = user.weight?.toString() ?? '';
          weightTargetController.text = user.weightTarget?.toString() ?? '';
          heightController.text = user.height?.toString() ?? '';
          bmiController.text = user.bmi?.toString() ?? '';
          selectedGender.value = user.gender;
          selectedDailyActivity.value = user.fa;
        }
      });
      return () {
        fullNameController.removeListener(validateInputs);
        usernameController.removeListener(validateInputs);
        ageController.removeListener(validateInputs);
        weightController.removeListener(validateInputs);
        weightTargetController.removeListener(validateInputs);
        heightController.removeListener(validateInputs);
        ageController.removeListener(calculateBMI);
        weightController.removeListener(calculateBMI);
        heightController.removeListener(calculateBMI);
        selectedDailyActivity.removeListener(dailyActivityListener);
        selectedGender.removeListener(genderListener);
      };
    }, [userAsync]);

    Future<void> _refreshData() async {
      await Future.delayed(const Duration(seconds: 2));
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          userAsync.when(
                            data: (data) {
                              return CircleAvatar(
                                radius: 70,
                                backgroundImage: pickedImage.value != null
                                    ? FileImage(File(pickedImage.value!.path))
                                    : (data?.imageUrl != null &&
                                            data!.imageUrl!.isNotEmpty
                                        ? NetworkImage(data.imageUrl!)
                                            as ImageProvider
                                        : AssetImage(
                                            Assets.images.defaultProfile.path)),
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
                              );
                            },
                            error: (error, stackTrace) {
                              return Text(
                                'Error: $error',
                                style: GoogleFonts.montserrat(
                                    color: Colors.red, fontSize: 14),
                              );
                            },
                            loading: () => const Center(
                                child: CircularProgressIndicator(
                              color: AppColor.darkGreen,
                            )),
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
                                            title: const Text(
                                                "Capture from Camera"),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              await pickImage(
                                                  ImageSource.camera);
                                            },
                                          ),
                                          ListTile(
                                            leading: const Icon(Icons.photo),
                                            title: const Text(
                                                "Select from Gallery"),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              await pickImage(
                                                  ImageSource.gallery);
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
                  ),
                  const Gap(40),
                  CustomFloatingTextField(
                    label: 'Full Name',
                    controller: fullNameController,
                    errorText: (isTouched.value['fullName']! ||
                                isButtonEnabled.value) &&
                            fullNameController.text.isEmpty
                        ? 'Full Name is required'
                        : null,
                    onTap: () => isTouched.value = {
                      ...isTouched.value,
                      'fullName': true
                    },
                  ),
                  const Gap(20),
                  CustomFloatingTextField(
                    label: 'Username',
                    controller: usernameController,
                    errorText: (isTouched.value['username']! ||
                                isButtonEnabled.value) &&
                            usernameController.text.isEmpty
                        ? 'username is required'
                        : null,
                    onTap: () => isTouched.value = {
                      ...isTouched.value,
                      'username': true
                    },
                  ),
                  const Gap(20),
                  DailyActivityDropdown(
                    onSelected: (value) {
                      selectedDailyActivity.value = value;
                      validateInputs();
                    },
                    selectedValue: selectedDailyActivity.value,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'Age',
                          suffixText: 'Y.O',
                          controller: ageController,
                          errorText: (isTouched.value['age']! ||
                                      isButtonEnabled.value) &&
                                  ageController.text.isEmpty
                              ? 'Age is required'
                              : null,
                          onTap: () => isTouched.value = {
                            ...isTouched.value,
                            'age': true
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomTextField(
                          label: 'Weight',
                          suffixText: 'Kg',
                          controller: weightController,
                          errorText: (isTouched.value['weight']! ||
                                      isButtonEnabled.value) &&
                                  weightController.text.isEmpty
                              ? 'Weight is required'
                              : null,
                          onTap: () => isTouched.value = {
                            ...isTouched.value,
                            'weight': true
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomTextField(
                            label: 'Weight Target',
                            suffixText: 'Kg',
                            controller: weightTargetController,
                            errorText: (isTouched.value['weightTarget']! ||
                                        isButtonEnabled.value) &&
                                    weightTargetController.text.isEmpty
                                ? 'Weight target is required'
                                : null,
                            onTap: () => isTouched.value = {
                                  ...isTouched.value,
                                  'weightTarget': true
                                }),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'Height',
                          suffixText: 'cm',
                          controller: heightController,
                          errorText: (isTouched.value['height']! ||
                                      isButtonEnabled.value) &&
                                  heightController.text.isEmpty
                              ? 'Height is required'
                              : null,
                          onTap: () => isTouched.value = {
                            ...isTouched.value,
                            'height': true
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: GenderDropdown(
                          onSelected: (value) {
                            selectedGender.value = value;
                            validateInputs();
                          },
                          selectedValue: selectedGender.value,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomTextField(
                          label: 'BMI',
                          suffixText: 'Kg/m2',
                          controller: bmiController,
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const Gap(50),
                  CustomButtonWidget(
                    onTap: () {
                      handleEdit();
                    },
                    text: isLoading.value ? 'Loading..' : 'Save',
                    backgroundColor: isButtonEnabled.value
                        ? AppColor.darkGreen
                        : AppColor.disableButton,
                  ),
                  const Gap(80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
