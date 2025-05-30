import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/features/core/theme/app_theme.dart';
import 'package:recipes_app/features/home/presentation/bloc/recipes_bloc.dart';
import 'package:recipes_app/features/home/presentation/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: BlocProvider(
        create: (context) => RecipesBloc()..add(GetMealsEvent()),
        child: HomeScreen(),
      ),
    );
  }
}
