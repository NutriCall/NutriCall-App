import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/auth/pages/controllers/post_register_controllers.dart';
import 'package:nutri_call_app/helpers/buttons/buttons.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';
import 'package:nutri_call_app/helpers/widget/daily_activity_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/gender_dropdown.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController fullNameController = useTextEditingController();
    final TextEditingController usernameController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final TextEditingController ageController = useTextEditingController();
    final TextEditingController weightController = useTextEditingController();
    final TextEditingController weightTargetController =
        useTextEditingController();
    final TextEditingController heightController = useTextEditingController();
    final TextEditingController bmiController = useTextEditingController();

    final selectedDailyActivity = useState<String?>(null);
    final selectedGender = useState<String?>(null);

    final isTouched = useState({
      'fullName': false,
      'username': false,
      'password': false,
      'age': false,
      'weight': false,
      'weightTarget': false,
      'height': false,
    });

    final isButtonEnabled = useState(false);
    final isLoading = useState(false);

    void validateInputs() {
      bool isValid = fullNameController.text.isNotEmpty &&
          usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
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

    void showRegistrationSuccessDialog(BuildContext context) {
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
                  'your account has been successfully registered',
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
                    context.pushNamed(RouteName.loginPage);
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
      passwordController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'password': true};
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

      return () {
        fullNameController.removeListener(validateInputs);
        usernameController.removeListener(validateInputs);
        passwordController.removeListener(validateInputs);
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
    }, [
      fullNameController,
      usernameController,
      passwordController,
      ageController,
      weightController,
      weightTargetController,
      heightController
    ]);

    final postRegisterNotifier =
        ref.read(postRegisterNotifierProvider.notifier);

    void handleRegister() {
      if (!isButtonEnabled.value || isLoading.value) return;

      isLoading.value = true;
      final registerParams = RegisterParams(
        fullName: fullNameController.text,
        username: usernameController.text,
        password: passwordController.text,
        age: int.tryParse(ageController.text) ?? 0,
        weight: int.tryParse(weightController.text) ?? 0,
        weightTarget: int.tryParse(weightTargetController.text) ?? 0,
        height: int.tryParse(heightController.text) ?? 0,
        bmi: double.tryParse(bmiController.text) ?? 0.0,
        gender: selectedGender.value ?? '',
        fa: selectedDailyActivity.value ?? '',
      );

      postRegisterNotifier.fetch(
        params: registerParams,
        onSuccess: (responseData) {
          isLoading.value = false;
          showRegistrationSuccessDialog(context);
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

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign Up',
        onBack: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(30),
              CustomFloatingTextField(
                label: 'Full Name',
                controller: fullNameController,
                errorText:
                    (isTouched.value['fullName']! || isButtonEnabled.value) &&
                            fullNameController.text.isEmpty
                        ? 'Full Name is required'
                        : null,
                onTap: () =>
                    isTouched.value = {...isTouched.value, 'fullName': true},
              ),
              const Gap(20),
              CustomFloatingTextField(
                label: 'Username',
                controller: usernameController,
                errorText:
                    (isTouched.value['username']! || isButtonEnabled.value) &&
                            usernameController.text.isEmpty
                        ? 'username is required'
                        : null,
                onTap: () =>
                    isTouched.value = {...isTouched.value, 'username': true},
              ),
              const Gap(20),
              CustomFloatingTextField(
                label: 'Password',
                isPassword: true,
                controller: passwordController,
                errorText:
                    (isTouched.value['password']! || isButtonEnabled.value) &&
                            passwordController.text.isEmpty
                        ? 'password is required'
                        : null,
                onTap: () =>
                    isTouched.value = {...isTouched.value, 'password': true},
              ),
              const Gap(20),
              DailyActivityDropdown(
                onSelected: (value) {
                  selectedDailyActivity.value = value;
                  validateInputs();
                },
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    label: 'Age',
                    suffixText: 'Y.O',
                    controller: ageController,
                    errorText:
                        (isTouched.value['age']! || isButtonEnabled.value) &&
                                ageController.text.isEmpty
                            ? 'Age is required'
                            : null,
                    onTap: () =>
                        isTouched.value = {...isTouched.value, 'age': true},
                  )),
                  const Gap(16),
                  Expanded(
                      child: CustomTextField(
                    label: 'Weight',
                    suffixText: 'Kg',
                    controller: weightController,
                    errorText:
                        (isTouched.value['weight']! || isButtonEnabled.value) &&
                                weightController.text.isEmpty
                            ? 'Weight is required'
                            : null,
                    onTap: () =>
                        isTouched.value = {...isTouched.value, 'weight': true},
                  )),
                  const Gap(16),
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
                    },
                  )),
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
                    errorText:
                        (isTouched.value['height']! || isButtonEnabled.value) &&
                                heightController.text.isEmpty
                            ? 'Height is required'
                            : null,
                    onTap: () =>
                        isTouched.value = {...isTouched.value, 'height': true},
                  )),
                  const Gap(16),
                  Expanded(
                    child: GenderDropdown(
                      onSelected: (value) {
                        selectedGender.value = value;
                        validateInputs();
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                      child: CustomTextField(
                    label: 'BMI',
                    suffixText: 'Kg/m2',
                    controller: bmiController,
                    readOnly: true,
                  )),
                ],
              ),
              const Gap(65),
              CustomButtonWidget(
                onTap: () {
                  handleRegister();
                },
                text: isLoading.value ? 'Loading..' : 'Sign Up',
                backgroundColor: isButtonEnabled.value
                    ? AppColor.darkGreen
                    : AppColor.disableButton,
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColor.lightBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteName.loginPage);
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColor.darkGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
