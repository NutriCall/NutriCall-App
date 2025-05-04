import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/plan/controllers/get_composition_controllers.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_search_field.dart';
import 'package:nutri_call_app/routers/router_name.dart';

import 'package:nutri_call_app/utils/app_color.dart';

class AddIngredientsPage extends ConsumerStatefulWidget {
  const AddIngredientsPage({super.key});

  @override
  _AddIngredientsPageState createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends ConsumerState<AddIngredientsPage> {
  TextEditingController searchController = TextEditingController();

  OverlayEntry? overlayEntry;

  late String _lastSearchQuery = '';
  void _debouncedSearch(String query) {
    if (query.isEmpty) {
      if (overlayEntry != null) {
        overlayEntry?.remove();
        overlayEntry = null;
      }
      ref.read(fetchCompositionControllersProvider.notifier).clear();

      return;
    }

    if (_lastSearchQuery != query) {
      _lastSearchQuery = query;
      _searchMeals(query);
      _searchCompositions(query);
    }
  }

  void _searchMeals(String query) {
    if (overlayEntry != null) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

  void _searchCompositions(String query) {
    ref
        .read(fetchCompositionControllersProvider.notifier)
        .fetch(namaBahan: query);
  }

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        _debouncedSearch(searchController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Meal',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingredients',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.semiBlack),
              ),
              const Gap(16),
              CustomSearchField(
                hintText: "Search ingredients..",
                controller: searchController,
                onSearch: () {
                  _debouncedSearch(searchController.text);
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(fetchCompositionControllersProvider);
                  return Column(
                    children: [
                      if (state is AsyncLoading &&
                          state.value != null &&
                          state.value!.isEmpty)
                        const CircularProgressIndicator(
                          color: AppColor.darkGreen,
                        ),
                      if (state is AsyncData &&
                          state.value != null &&
                          state.value!.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.value!.length,
                          itemBuilder: (context, index) {
                            final composition = state.value![index];
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      composition.namaBahan ?? "",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: AppColor.darkGreen,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.north_east,
                                    size: 20,
                                    color: AppColor.darkGreen,
                                  ),
                                ],
                              ),
                              onTap: () {
                                context.pushNamed(
                                  RouteName.itemDetailMealPage,
                                  pathParameters: {
                                    'id': composition.id.toString(),
                                    'name': composition.namaBahan ?? '',
                                    'type': 'Ingredients',
                                  },
                                );
                              },
                            );
                          },
                        ),
                      if (state is AsyncError)
                        Text(state.error.toString(),
                            style: const TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
              const Gap(20),
            ],
          )),
    );
  }
}
