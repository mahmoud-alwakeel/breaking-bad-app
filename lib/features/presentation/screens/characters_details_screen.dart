import 'dart:math';

import 'package:breaking_bad/consts/app_colors.dart';
import 'package:breaking_bad/features/data/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharactersDetailsScreen extends StatelessWidget {
  const CharactersDetailsScreen({super.key, required this.characterModel});

  final CharacterModel characterModel;

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          characterModel.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Hero(
          tag: characterModel.id,
          child: Image.network(
            characterModel.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget CharacterInfo({required String title, required String value}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ]),
    );
  }

  Widget BuildDivider(double endIndent){
    return Divider(
      thickness: 2,
      height: 30,
      endIndent: endIndent,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepPurple,
        body: CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterInfo(title: 'status : ', value: characterModel.status),
                  BuildDivider(300),
                ],
              ),
            )
          ]),
        ),
      ],
    ));
  }
}
