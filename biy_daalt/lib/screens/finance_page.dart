import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Санхүүгийн хуудас',
        style: TextStyle(fontSize: 24, color: Colors.green),
      ),
    );
  }
}
