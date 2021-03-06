import 'package:flutter/material.dart';
import 'package:flutter_html_textview_render/html_text_view.dart';

class PostDetails extends StatefulWidget {
  final String imgurl, title, desc;

  PostDetails({this.imgurl, this.title, this.desc});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.imgurl),
              SizedBox(height: 16),
              HtmlTextView(
                data: "<h2>${widget.title}</h2>",
              ),
              SizedBox(height: 16),
              HtmlTextView(
                data: widget.desc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
