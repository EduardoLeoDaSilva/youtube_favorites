import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_favorites/delegates/searchWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Youtube',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
        ),
        backgroundColor: Colors.black,
        actions: [
          const Align(alignment: Alignment.center, child: Text('0')),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () async {
              var result =
                  await showSearch(context: context, delegate: SearchWidget());
              print('');
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: VideosPage(),
    );
  }
}
