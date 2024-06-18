import 'package:breaking_bad/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Approuter {
  Route? generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}