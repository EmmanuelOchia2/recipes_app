import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/home/presentation/bloc/recipes_bloc.dart';
import 'package:recipes_app/features/home/presentation/meal_details_screen.dart';
import 'package:recipes_app/features/home/presentation/search_results_screen.dart';
import 'package:recipes_app/features/home/presentation/widgets/empty_widget.dart';
import 'package:recipes_app/features/home/presentation/widgets/loading_widget.dart';
import 'package:recipes_app/features/home/presentation/widgets/recipes_list_item.dart';
import 'package:recipes_app/features/home/presentation/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipesBloc, RecipesState>(
      listener: (context, state) {
        //navigate to details view
        if (state.selectedMeal != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealDetailsScreen(
                mealDetail: state.selectedMeal!,
              ),
            ),
          );
        }
        if (state is RecipesSearchLoadedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResultsScreen(
                searchResults: state.searchResults ?? [],
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Recipes PRO'),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SearchBarWidget(
                controller: TextEditingController(),
              ),
              BlocBuilder<RecipesBloc, RecipesState>(
                builder: (context, state) {
                  if (state.loading && state.recipes.isEmpty) {
                    return const LoadingWidget();
                  }
                  if (state.recipes.isEmpty) {
                    //Mock empty page
                    return const EmptyWidget();
                  }
                  return Column(
                    children: List.generate(
                      state.recipes.length,
                      (index) {
                        final item = state.recipes[index];
                        return RecipesListItem(
                          item: item,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_isBottom) {
      print('is hitting bottom');

      BlocProvider.of<RecipesBloc>(context).add(GetMealsEvent());
    }
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
