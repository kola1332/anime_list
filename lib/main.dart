import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/api.dart';

import 'models/anime.dart';

void main() async {
  Dio dio = Dio();
  ApiService apiService = ApiService(dio);
  Anime anime = await apiService.get();
  runApp( MainApp(anime: anime,));
}

class MainApp extends StatefulWidget {
    Anime anime;
  MainApp({super.key, required this.anime});

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
      debugShowCheckedModeBanner:  false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: widget.anime.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.anime.data![index].title),
            );
          },
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
