import 'package:fl_damflix/models/models.dart';
import 'package:fl_damflix/providers/actors_provider.dart';
import 'package:flutter/material.dart';

class CastCarrousel extends StatelessWidget {
  const CastCarrousel({Key? key, required this.actorsProvider})
    : super(key: key);
  final ActorsProvider actorsProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        itemCount: actorsProvider.onDisplayActors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _CastCard(cast: actorsProvider.onDisplayActors[index]);
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({super.key, required this.cast});
  final Cast cast;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(cast.fullPosterPath),
              height: 100,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
