import 'package:flutter/material.dart';

import 'package:pok_ful/model/pokemon_model.dart';
import 'package:pok_ful/service/pokemon_service.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PokemonApp"),
        ),
        body: FutureBuilder(
            future: PokemonService().getPokemon(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (snapshot.data is String) {
                return Center(
                  child: Text(snapshot.data),
                );
              } else {
                PokemonModel data = snapshot.data as PokemonModel;
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'info',arguments: data.pokemon[index]);
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xffFC7CFF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            Positioned(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 110,
                                  child: Image.network(
                                      data.pokemon[index].img.toString()),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                Center(
                                  child: Container(
                                    height: 27.0,
                                    width: 147,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xff676767),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "#${data.pokemon[index].num.toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 12,
                                              color: Color(0xffF993FB),
                                            ),
                                          ),
                                          Text(
                                            data.pokemon[index].name.toString(),
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w800,
                                                color: Color(
                                                  0xffFFFFFF,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      );
                    });
              }
            }));
  }
}
