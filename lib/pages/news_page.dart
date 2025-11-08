import 'package:flutter/material.dart';

void main() {
  runApp(const NewsPage());
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: const Center(
        child: Text(
          'News Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
