import 'package:flutter/material.dart';
import 'package:isapp/views/posts/details.dart';
import 'package:isapp/wp-api.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';

class PostItem extends StatefulWidget {
  final String imgsrc, title, desc, content;
  PostItem({this.content, this.desc, this.imgsrc, this.title});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  var imgurl = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetails(
              imgurl: imgurl,
              title: widget.title,
              desc: widget.content,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: fetchWpPostImgUrl(widget.imgsrc),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    imgurl = snapshot.data["guid"]["rendered"];
                    return Image.network(snapshot.data["guid"]["rendered"]);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
            SizedBox(height: 16),
            HtmlTextView(
              data: "<h2>${widget.title}</h2>",
            ),
            SizedBox(height: 16),
            HtmlTextView(
              data: "<div style='line-height:32px'>${widget.desc}</div>",
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
