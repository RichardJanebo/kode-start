import 'package:flutter/material.dart';
import 'package:rick_morty_app/models/character_detail_model.dart';
import 'package:rick_morty_app/utils/app_collors.dart';

class DetailCard extends StatelessWidget {
  final CharacterDetailsModel character;

  const DetailCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 383,
        color: AppCollors.textPricipalContent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                character.image,
                alignment: Alignment.topCenter,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Conteúdo
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome
                  Text(
                    character.name.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.5,
                      height: 1.0,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 38),

                  // Status + Species
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/Ellipse.png',
                        width: 8,
                        height: 8,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${character.status} - ${character.species}',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.5,
                          height: 1.0,
                          letterSpacing: 0.0,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Última localização
                  const Text(
                    'Last know location:',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.5,
                      height: 1.0,
                      letterSpacing: 0.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.location,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      height: 1.0,
                      letterSpacing: 0.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Primeiro episódio
                  const Text(
                    'First seen in:',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.5,
                      height: 1.0,
                      letterSpacing: 0.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    character.episode,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      height: 1.0,
                      letterSpacing: 0.0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
