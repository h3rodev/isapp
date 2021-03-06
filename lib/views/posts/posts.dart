import 'package:flutter/material.dart';
import 'package:isapp/wp-api.dart';
import 'items.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inspiresean App'),
      ),
      body: Container(
        child: FutureBuilder(
            future: fetchWpPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map wppost = snapshot.data[index];
                    return PostItem(
                        imgsrc: wppost['_links']['wp:featuredmedia'][0]['href'],
                        title: wppost['title']['rendered'],
                        desc: wppost['excerpt']['rendered'],
                        content: wppost['content']['rendered']);
                  },
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
