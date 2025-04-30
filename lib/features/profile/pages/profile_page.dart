import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/core/controllers/authentication_provider.dart';
import 'package:nutri_call_app/extensions/build_context.ext.dart';
import 'package:nutri_call_app/features/home/controllers/current_user_controllers.dart';
import 'package:nutri_call_app/features/profile/widget/profile_header_widget.dart';
import 'package:nutri_call_app/features/profile/widget/profile_detail_item_widget.dart';
import 'package:nutri_call_app/helpers/buttons/buttons.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  Future<void> _refreshProfile() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(authenticationProvider);
    final dataUser = ref.watch(fetchCurrentUserNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchCurrentUserNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Profile Page'),
        body: RefreshIndicator(
          color: AppColor.semiBlack,
          onRefresh: _refreshProfile,
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: dataUser.when(
                data: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(50),
                      ProfileHeader(
                        imagePath: data?.imageUrl ?? '',
                        name: data?.fullName ?? '',
                        username: data?.username ?? '',
                      ),
                      const Gap(30),
                      Column(
                        children: [
                          ProfileDetailItem(
                              label: 'Age', value: '${data?.age} years old'),
                          ProfileDetailItem(
                              label: 'Weight', value: '${data?.weight} Kg'),
                          ProfileDetailItem(
                              label: 'Weight',
                              value: '${data?.weightTarget} Kg'),
                          ProfileDetailItem(
                              label: 'Height', value: '${data?.height} cm'),
                          ProfileDetailItem(
                              label: 'Gender', value: data?.gender ?? ''),
                          ProfileDetailItem(
                            label: 'Daily Activity',
                            value: data?.fa ?? '',
                          ),
                          ProfileDetailItem(
                              label: 'BMI', value: '${data?.bmi} Kg/m2'),
                        ],
                      ),
                      const Gap(50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButtonWidget(
                                  text: 'Edit',
                                  backgroundColor: AppColor.darkGreen,
                                  textColor: Colors.white,
                                  onTap: () {
                                    context
                                        .pushNamed(RouteName.editProfilePage);
                                  },
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                child: CustomButtonWidget(
                                  text: 'Logout',
                                  isOutlined: true,
                                  borderColor: AppColor.darkGreen,
                                  textColor: AppColor.darkGreen,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 27, vertical: 22),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.logout.path,
                                                height: 50,
                                                width: 50,
                                                fit: BoxFit.contain,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                  Color(0xFFFD6464),
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                              const Gap(24),
                                              Text(
                                                'Are you sure you want to logout?',
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
                                                  Navigator.pop(context);
                                                },
                                                label: 'Tidak',
                                                color: AppColor.lightRed,
                                              ),
                                              const Gap(8),
                                              Button.outlined(
                                                textColor: AppColor.textColor2,
                                                disabled: logout.isLoading,
                                                color: Colors.transparent,
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          authenticationProvider
                                                              .notifier)
                                                      .logout(
                                                    onSuccess: () {
                                                      context
                                                          .showSuccessSnackbar(
                                                              'Logout Berhasil');
                                                    },
                                                    onError: () {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Logout Gagal'),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                label: 'Ya',
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  return Text(
                    'Error: $error',
                    style:
                        GoogleFonts.montserrat(color: Colors.red, fontSize: 14),
                  );
                },
                loading: () => const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.darkGreen,
                )),
              )),
        ),
      ),
    );
  }
}
