import "package:flutter/material.dart";

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Page"),
      ),
      body: const Center(
        child: Text("This is the Contact Page"),
      ),
    );
  }
}
