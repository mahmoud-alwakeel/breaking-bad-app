import 'package:breaking_bad/config/router/app_routes.dart';
import 'package:breaking_bad/features/presentation/screens/characters_details_screen.dart';
import 'package:breaking_bad/features/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Approuter {
  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharactersDetailsScreen());
    }
  }
}