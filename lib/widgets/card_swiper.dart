import 'package:card_swiper/card_swiper.dart';
import 'package:fl_peliculas/models/now_playing_response.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<Result> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      padding: const EdgeInsets.all(30),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: ((context, index) {
          final movie = movies[index];
          print(movie.posterPath);
          return GestureDetector(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  'details',
                  arguments: movie,
                ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
