import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Зарлал'),
      ),
      body: const Center(
        child: Text(
          'Энд зарлал харагдана',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
