import 'package:breaking_bad/consts/app_colors.dart';
import 'package:breaking_bad/features/business_logic/cubit/characters_cubit.dart';
import 'package:breaking_bad/features/data/models/character_model.dart';
import 'package:breaking_bad/features/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<CharacterModel> allCharacters;
  late List<CharacterModel> searchedCharacters;
  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for a character',
          hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
      style: const TextStyle(color: Colors.white),
      onChanged: (val) {
        searchForItem(val);
      },
    );
  }

  void searchForItem(String val) {
    searchedCharacters = allCharacters
        .where((character) => character.name.toLowerCase().startsWith(val))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.clear, color: Colors.white,),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search, color: Colors.white,),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoadedState) {
        allCharacters = state.characters;
        return buildLoadedListWidget();
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsetsDirectional.zero,
      itemCount: _searchController.text.isEmpty ? allCharacters.length : searchedCharacters.length,
      itemBuilder: ((context, index) {
        return CharacterItem(
          characterModel: _searchController.text.isEmpty ? allCharacters[index]: searchedCharacters[index],
        );
      }),
    );
  }

  Widget _buildAppBartitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _isSearching ? const BackButton(color: Colors.white,) : const SizedBox(),
            backgroundColor: AppColors.deepPurple,
            title: _isSearching ? _buildSearchField() : _buildAppBartitle(),
            actions: _buildAppBarActions(),
            ),
        body: buildBlocWidget());
  }
}
