import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/home/controllers/cal_today_controllers.dart';
import 'package:nutri_call_app/features/home/controllers/current_user_controllers.dart';
import 'package:nutri_call_app/features/home/widget/calorie_consumption_widget.dart';
import 'package:nutri_call_app/features/home/widget/menu_home_widget.dart';
import 'package:nutri_call_app/features/home/widget/nutricall_banner_widget.dart';
import 'package:nutri_call_app/features/recipe/controllers/get_list_recipe_controllers.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

final recipeLoadingProvider = StateProvider<bool>((ref) => false);

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataUser = ref.watch(fetchCurrentUserNotifierProvider);
    final calTodayAsync = ref.watch(fetchCalTodayNotifierProvider);
    final isLoading = ref.watch(recipeLoadingProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(fetchCurrentUserNotifierProvider.notifier).fetch();
        ref.read(fetchCalTodayNotifierProvider.notifier).fetch();
      });
      return null;
    }, []);

    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: RefreshIndicator(
              color: AppColor.darkGreen,
              onRefresh: () async {
                await ref
                    .read(fetchCurrentUserNotifierProvider.notifier)
                    .fetch();
                await ref.read(fetchCalTodayNotifierProvider.notifier).fetch();
              },
              child: ListView(
                children: [
                  dataUser.when(
                    data: (data) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                        child: Row(
                          children: [
                            Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: AppColor.lightGrey,
                                  shape: BoxShape.circle,
                                ),
                                child: data?.imageUrl != null
                                    ? ClipOval(
                                        child: Image.network(
                                          data!.imageUrl!,
                                          fit: BoxFit.cover,
                                          width: 45,
                                          height: 45,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.person_2_rounded,
                                              color: AppColor.darkGreen,
                                              size: 28,
                                            );
                                          },
                                        ),
                                      )
                                    : Container(
                                        width: 45,
                                        height: 45,
                                        decoration: const BoxDecoration(
                                          color: AppColor.disableButton,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.person,
                                            color: AppColor.darkGreen,
                                            size: 28,
                                          ),
                                        ),
                                      )),
                            const Gap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi! ${data?.username ?? ''}',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.semiBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Welcome back',
                                  style: GoogleFonts.poppins(
                                    color: AppColor.lightBlack,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                  const Gap(10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: NutricallBanner(),
                  ),
                  const Gap(22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: calTodayAsync.when(
                      data: (data) => CalorieConsumptionWidget(
                        calories: data?.calories ?? 0,
                        goal: data?.goal ?? 1,
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.darkGreen,
                        ),
                      ),
                      error: (e, _) => Text('Error: $e'),
                    ),
                  ),
                  const Gap(24),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(RouteName.weeklyReportPage);
                        },
                        child: MenuHomeWidget(
                          title: 'Weekly Report',
                          assetPath: Assets.images.plan.path,
                          backgroundColor: AppColor.lightOrange,
                          textColor: AppColor.orange,
                        ),
                      )),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        ref.read(recipeLoadingProvider.notifier).state = true;
                        ref
                            .read(fetchListRecipeControllersProvider.notifier)
                            .fetch(
                          onSuccess: () async {
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            ref.read(recipeLoadingProvider.notifier).state =
                                false;
                            context.pushNamed(RouteName.recipePage);
                          },
                          onFailed: () {
                            ref.read(recipeLoadingProvider.notifier).state =
                                false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to get data')),
                            );
                          },
                        );
                      },
                      child: MenuHomeWidget(
                        title: 'Healthy Food Recipes',
                        assetPath: Assets.images.recipe.path,
                        backgroundColor: AppColor.lightBlue,
                        textColor: AppColor.blue,
                        imageScale: 0.9,
                      ),
                    ),
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColor.darkGreen,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
