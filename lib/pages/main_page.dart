import 'package:flutter/material.dart';

import '../models/anime.dart';

class MainPage extends StatefulWidget {
  final Anime anime;
  const MainPage({super.key, required this.anime});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: widget.anime.data!.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 3,
            mainAxisSpacing: 10,
            mainAxisExtent: 280,
          ),
          itemBuilder: ((context, index) {
            return Container(
              padding: const EdgeInsets.all(3),
              height: 200,
              width: 150,
              child: Card(
                  // semanticContainer: false,
                  // clipBehavior: Clip.hardEdge,
                  elevation: 0,
                  shape:  const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  // margin: const EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
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
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(),
                          shape: BoxShape.rectangle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 2,
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
    );
  }
}
