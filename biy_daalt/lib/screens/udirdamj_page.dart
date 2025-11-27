import 'package:flutter/material.dart';

const Color blueLine = Color(0xFF3F51B5);

class UdirdamjPage extends StatelessWidget {
  const UdirdamjPage({super.key}); // Const constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'УДИРДАМЖ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: blueLine,
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'Багш одоогоор мэдээ оруулаагүй байна.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
