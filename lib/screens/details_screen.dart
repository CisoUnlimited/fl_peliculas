import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _InfoPelicula(),
              _Overview(),
              CastCarrousel(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black26,
          child: const Text('movie.title', style: TextStyle(fontSize: 16)),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://placehold.co/500x300/png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _InfoPelicula extends StatelessWidget {
  const _InfoPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://placehold.co/200x300/png'),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: Theme.of(context).textTheme.headlineLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.year',
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 20, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('movie.rate'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Nulla do cupidatat eiusmod culpa ullamco nostrud anim ad labore est fugiat id esse laborum. Lorem sunt veniam veniam do. Tempor sit fugiat in ullamco do. Eiusmod anim dolore veniam qui minim dolore ea nisi ad velit laboris id. Eu eiusmod sint velit incididunt voluptate exercitation qui cupidatat reprehenderit deserunt eu.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
