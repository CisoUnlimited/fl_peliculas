import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Damflix'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}),
        ],
      ),
      body: Column(children: [
        CardSwiper(

        )
        // TODO: Scroll horizontal de películas
      ]),
    );
  }
}
