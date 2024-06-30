import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lumina/core/constants/constants.dart';
import 'package:lumina/features/movies/data/model/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movieModel;
  const MovieCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Image(
          wSize: kLargePosterSize,
          posterUrl: movieModel.posterImageUrl(kLargePosterSize),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  final String? posterUrl;
  final String? backdropUrl;
  final String wSize;

  const _Image(
      {super.key, this.posterUrl, this.backdropUrl, required this.wSize});

  @override
  Widget build(BuildContext context) {
    String imageUrl = posterUrl ?? backdropUrl!;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: 300.0,
      width: 363 / 545 * 300.0,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.0),
          image: DecorationImage(image: imageProvider),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
