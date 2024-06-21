import 'package:breaking_bad/config/router/app_routes.dart';
import 'package:breaking_bad/features/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.characterModel});

  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(4),
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.charactersDetailsScreen, arguments: characterModel);
        },
        child: GridTile(
          footer: Hero(
            tag: characterModel.id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              color: Colors.black45,
              alignment: Alignment.bottomCenter,
              child: Text(characterModel.name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),),
            ),
          ),
          child: Container(
            child: characterModel.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    placeholder: 'assets/images/spinner.gif',
                    image: characterModel.image,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/placeholder.png'),
          ),
        ),
      ),
    );
  }
}
