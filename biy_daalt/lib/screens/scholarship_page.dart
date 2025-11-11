import 'package:flutter/material.dart';

class ScholarshipPage extends StatelessWidget {
  const ScholarshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тэтгэлэг'),
      ),
      body: const Center(
        child: Text(
          'Энд тэтгэлгийн мэдээлэл харагдана',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
