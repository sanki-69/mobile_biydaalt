// lib/screens/study_plan_page.dart
import 'package:flutter/material.dart';

class StudyPlanPage extends StatelessWidget {
  const StudyPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'СУРГАЛТЫН ТӨЛӨВЛӨГӨӨ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('ДЭЭД БОЛОВСРОЛЫН СУРГ ХИЧЭЭЛ\nЗаавал суралцах хичээл'),
            const SizedBox(height: 8),
            _tableHeader(),
            const SizedBox(height: 6),
            ..._generateRows(10), // 10 rows

            const SizedBox(height: 24),

            _sectionTitle('ДЭЭД БОЛОВСРОЛЫН СУРГ ХИЧЭЭЛ\nСонгон суралцах хичээл'),
            const SizedBox(height: 8),
            _tableHeader(),
            const SizedBox(height: 6),
            ..._generateRows(9), // 9 rows
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _headerCell('Хич.код', flex: 1),
          _headerCell('Хич.Нэр', flex: 2),
          _headerCell('Кредит', flex: 1),
          _headerCell('Улирал', flex: 1),
          _headerCell('Төлөв', flex: 1),
        ],
      ),
    );
  }

  Widget _headerCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _generateRows(int count) {
    return List.generate(count, (index) {
      final isEven = index % 2 == 0;
      return Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isEven ? Colors.white : Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            _rowCell('F.IT08', flex: 1),
            _rowCell('Хүний хөгжил', flex: 2),
            _rowCell('3.0-кр', flex: 1),
            _rowCell('Намар', flex: 1),
            _rowCell('үзсэн', flex: 1, color: Colors.green),
          ],
        ),
      );
    });
  }

  Widget _rowCell(String text, {required int flex, Color? color}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          color: color ?? Colors.black87,
          fontWeight: color != null ? FontWeight.bold : FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
