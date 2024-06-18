import 'package:breaking_bad/config/router/app_router.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BreakingBad(approuter: Approuter(),));
}

class BreakingBad extends StatelessWidget {
  const BreakingBad({super.key, required this.approuter});

  final Approuter approuter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: approuter.generateRoute,
    );
  }
}