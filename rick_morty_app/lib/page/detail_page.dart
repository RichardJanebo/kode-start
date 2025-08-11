import 'package:flutter/material.dart';
import 'package:rick_morty_app/data/character_repository.dart';
import 'package:rick_morty_app/models/character_detail_model.dart';
import 'package:rick_morty_app/page/home_page.dart';
import 'package:rick_morty_app/utils/app_collors.dart';
import 'package:rick_morty_app/components/detail_card.dart'; // importando o novo widget

class DetailPage extends StatefulWidget {
  static const String routeId = '/detail';

  final int characterId;

  const DetailPage({super.key, required this.characterId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<CharacterDetailsModel> _character;

  @override
  void initState() {
    super.initState();
    _character = CharacterRepository.getCharacterById(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: FutureBuilder<CharacterDetailsModel>(
        future: _character,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }

          final character = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
            child: DetailCard(character: character),
          );
        },
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 130.92,
    backgroundColor: AppCollors.appBarBackgroundColor,
    leading: Transform.translate(
      offset: const Offset(0, -30),
      child: IconButton(
        iconSize: 20.97,
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushNamed(context, HomePage.routeId);
        },
      ),
    ),
    foregroundColor: AppCollors.textPrincipalColor,
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('lib/assets/logo.png', width: 115, height: 76),
        const SizedBox(height: 4),
        Text(
          'RICK AND MORTY API',
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.5,
            height: 1.0,
            letterSpacing: 0.165 * 14.5,
            color: Colors.white,
          ),
        ),
      ],
    ),
    centerTitle: true,
    actions: [
      Transform.translate(
        offset: const Offset(0, -30),
        child: IconButton(
          icon: Image.asset(
            'lib/assets/accont_icon.png',
            width: 31.46,
            height: 31.46,
          ),
          onPressed: () {},
        ),
      ),
    ],
  );
}
