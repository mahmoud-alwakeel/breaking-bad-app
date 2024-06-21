import 'package:breaking_bad/config/router/app_routes.dart';
import 'package:breaking_bad/features/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/features/data/models/character_model.dart';
import 'package:breaking_bad/features/data/repository/characters_repo.dart';
import 'package:breaking_bad/features/data/web_services/characters_web_services.dart';
import 'package:breaking_bad/features/presentation/screens/characters_details_screen.dart';
import 'package:breaking_bad/features/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepo charactersRepo;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepo =
        CharactersRepo(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepo: charactersRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => charactersCubit,
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.charactersDetailsScreen:
      final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (_) => CharactersDetailsScreen(characterModel: character,),
        );
      default:
        return null; // Return null if no matching route is found.
    }
  }
}
