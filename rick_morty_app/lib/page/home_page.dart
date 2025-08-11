import 'package:flutter/material.dart';
import 'package:rick_morty_app/components/character_card.dart';
import 'package:rick_morty_app/data/character_repository.dart';
import 'package:rick_morty_app/models/character_model.dart';
import 'package:rick_morty_app/utils/app_collors.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  static const String routeId = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CharacterModel> _characters = [];
  bool _isLoading = true;
  String? _error;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCharacters() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final list = await CharacterRepository.getAllCharacters();
      setState(() {
        _characters = list;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _searchCharacters(String query) async {
    if (query.isEmpty) {
      _loadCharacters();
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final list = await CharacterRepository.getCharacterByName(query);
      setState(() {
        _characters = list;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _characters = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Buscar personagem',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _searchCharacters(_searchController.text.trim());
                        // Fecha o drawer para mostrar os resultados
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    _searchCharacters(value.trim());
                    Navigator.of(context).pop();
                  },
                ),
              ),
              // ... outros itens do drawer se tiver
            ],
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
              child: Text(
                'Erro: $_error',
                style: const TextStyle(color: Colors.white),
              ),
            )
          : _characters.isEmpty
          ? const Center(
              child: Text(
                'Personagem não encontrado',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: _characters.length,
              itemBuilder: (context, index) {
                final character = _characters[index];
                return CharacterCard(
                  character: character,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPage.routeId,
                      arguments: character.id,
                    );
                  },
                );
              },
            ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 130.92,
      backgroundColor: AppCollors.appBarBackgroundColor,
      leading: Transform.translate(
        offset: const Offset(0, -40),
        child: Builder(
          builder: (context) => IconButton(
            iconSize: 20.97,
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      foregroundColor: AppCollors.textPrincipalColor,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('lib/assets/logo.png', width: 115, height: 76),
          const SizedBox(height: 4),
          const Text(
            'RICK AND MORTY API',
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 14.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Transform.translate(
          offset: const Offset(0, -40),
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
}
