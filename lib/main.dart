import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/api.dart';

import 'models/anime.dart';

void main() async {
  Dio dio = Dio();
  ApiService apiService = ApiService(dio);
  Anime anime = await apiService.get();
  runApp(MainApp(
    anime: anime,
  ));
}

class MainApp extends StatefulWidget {
  final Anime anime;
  const MainApp({super.key, required this.anime});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    loadAnime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: widget.anime.data!.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 3,
              mainAxisSpacing: 10,
              mainAxisExtent: 270,
            ),
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.all(3),
                height: 200,
                width: 150,
                child: Card(
                    // semanticContainer: false,
                    // clipBehavior: Clip.hardEdge,
                    elevation: 5,
                    // margin: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            widget.anime.data![index].title,
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 200,
                          width: 140,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Image.network(
                            widget.anime.data![index].images!.jpg!.imageUrl,
                            fit: BoxFit.fill,
                            // scale: 0.5,
                            // height: 150,
                            // width: 150,
                          ),
                        ),
                      ],
                    )),
              );
            }),
          ),
        ),
      ),
    );
  }

  Future<Anime> loadAnime() async {
    Dio dio = Dio();
    ApiService apiService = ApiService(dio);
    Anime anime = await apiService.get();
    return anime;
  }
}


// ListView.builder(
        //   itemCount: widget.anime.data!.length,
        //   itemBuilder: (context, index) {
        //     return GridView.count(
        //       crossAxisCount: 2,
        //       children: [
        //         Text(widget.anime.data![index].title),
        //         // ListTile(
        //         //   title: Text(widget.anime.data![index].title),
        //         // )
        //       ],
        //     );
        //     // return ListTile(
        //     //   title: Text(widget.anime.data![index].title),
        //     // );
        //   },
        // ),