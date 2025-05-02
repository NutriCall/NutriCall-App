import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/core/controllers/authentication_provider.dart';
import 'package:nutri_call_app/extensions/build_context.ext.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final username = useTextEditingController();
    final password = useTextEditingController();
    final auth = ref.watch(authenticationProvider);
    final isButtonEnabled = useState(false);

    ref.listen(
      authenticationProvider,
      (previous, next) {
        if (next is AsyncData && next.value != null) {
          context.pushReplacementNamed(RouteName.main);
        } else if (next is AsyncError) {
          context.showErrorSnackbar(next.error.toString());
        }
      },
    );

    useEffect(() {
      void updateButtonState() {
        isButtonEnabled.value = username.text.isNotEmpty &&
            password.text.isNotEmpty &&
            !auth.isLoading;
      }

      username.addListener(updateButtonState);
      password.addListener(updateButtonState);

      return () {
        username.removeListener(updateButtonState);
        password.removeListener(updateButtonState);
      };
    }, [username, password, auth.isLoading]);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.9, 0),
            end: Alignment.topCenter,
            colors: [AppColor.disabledGreen, AppColor.darkWhite],
          ),
        ),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(70),
                  Image.asset(
                    Assets.images.logoApp.path,
                    height: 180,
                  ),
                  const Gap(16),
                  Text(
                    'Welcome back!',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkGreen,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Let’s sign you in',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: AppColor.lightBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(50),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomFloatingTextField(
                          label: 'Username',
                          controller: username,
                        ),
                        const Gap(20),
                        CustomFloatingTextField(
                          label: "Password",
                          controller: password,
                          isPassword: true,
                        ),
                        const Gap(65),
                        CustomButtonWidget(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              ref.read(authenticationProvider.notifier).login(
                                    username: username.text,
                                    password: password.text,
                                  );
                            }
                          },
                          text: auth.isLoading ? 'Loading...' : 'Login',
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColor.lightBlack,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteName.signUpPage);
                        },
                        child: Text(
                          'Sign Up',
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
        ),
      ),
    );
  }
}
