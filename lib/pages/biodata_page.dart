import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataPage());
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biodata Page"),
      ),
      body: const Center(
        child: Text("This is the Biodata Page"),
      ),
    );
  }
}
