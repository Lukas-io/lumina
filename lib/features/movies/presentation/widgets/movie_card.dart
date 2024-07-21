import 'dart:math';

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
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
    double height = 114.0;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: 363 / 545 * height,
      imageBuilder: (context, imageProvider) => InkWell(
        onTap: (){},
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(image: imageProvider),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
