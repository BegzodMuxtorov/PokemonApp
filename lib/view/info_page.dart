import 'package:flutter/material.dart';

import 'package:pok_ful/model/pokemon_model.dart';

class InfoPage extends StatelessWidget {
  final Pokemon data;
  const InfoPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon info page"),
      ),
      body: Column(
        children: [
          Text(data.name.toString()),
          Text(data.id.toString()),
          Text(data.height.toString()),
          Image.network(data.img.toString()),
        ],
      ),
    );
  }
}
