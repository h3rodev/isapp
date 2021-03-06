import 'package:flutter/material.dart';
import './views/posts/posts.dart';

void main() {
  runApp(IsApp());
}

class IsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspiresean App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Posts(),
    );
  }
}
