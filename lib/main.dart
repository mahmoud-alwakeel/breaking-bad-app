import 'package:breaking_bad/config/router/app_router.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BreakingBad(approuter: AppRouter(),));
}

class BreakingBad extends StatelessWidget {
  const BreakingBad({super.key, required this.approuter});

  final AppRouter approuter;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: approuter.generateRoute,
    );
  }
}