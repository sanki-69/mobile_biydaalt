import 'package:flutter/material.dart';

const Color blueLine = Color(0xFF3F51B5);

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'ДҮНГИЙН МЭДЭЭЛЭЛ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        backgroundColor: blueLine,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSemesterSection(
              "2022-2023 оны хичээлийн жил, 1-р улирал",
              semester1Courses,
            ),
            const SizedBox(height: 16),
            _buildSemesterSection(
              "2022-2023 оны хичээлийн жил, 2-р улирал",
              semester2Courses,
            ),
            const SizedBox(height: 16),
            _buildSemesterSection(
              "2023-2024 оны хичээлийн жил, 1-р улирал",
              semester3Courses, // updated list used here
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemesterSection(
    String title,
    List<Map<String, String>> courses,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        _buildCourseTable(courses),
      ],
    );
  }

  Widget _buildCourseTable(List<Map<String, String>> courses) {
    // Calculate total credit
    final totalCredit = courses.fold<double>(
      0,
      (sum, c) => sum + double.parse(c['credit']!),
    );

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1.5), // Course code
        1: FlexColumnWidth(2.5), // Course name
        2: FlexColumnWidth(1), // Credit
        3: FlexColumnWidth(1), // Midterm
        4: FlexColumnWidth(1), // Final
        5: FlexColumnWidth(1), // Total
        6: FlexColumnWidth(1), // Letter
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        // Header row
        TableRow(
          children: [
            _header('Хич.код'),
            _header('Хич.Нэр', allowWrap: true),
            _header('Кредит'),
            _header('Б.Оноо'),
            _header('Ш.Оноо'),
            _header('Оноо'),
            _header('Үс.Үнэлгээ', allowWrap: true),
          ],
        ),
        // Blue line under header
        TableRow(
          children: List.generate(
            7,
            (_) => Container(height: 1, color: blueLine),
          ),
        ),
        // Data rows
        for (var c in courses) ...[
          TableRow(
            children: [
              _cell(c['code']!, textAlign: TextAlign.center),
              _cell(c['name']!, textAlign: TextAlign.center, allowWrap: true),
              _cell(c['credit']!, textAlign: TextAlign.center),
              _cell(c['midterm']!, textAlign: TextAlign.center),
              _cell(c['final']!, textAlign: TextAlign.center),
              _cell(c['total']!, textAlign: TextAlign.center),
              _cell(c['letter']!, textAlign: TextAlign.center, allowWrap: true),
            ],
          ),
          // Blue separator line after each course
          TableRow(
            children: List.generate(
              7,
              (_) => Container(height: 1, color: blueLine),
            ),
          ),
        ],
        // Total credit row
        TableRow(
          children: [
            _cell(''), // Course code empty
            _cell('Нийт кредит', textAlign: TextAlign.center),
            _cell(totalCredit.toStringAsFixed(1), textAlign: TextAlign.center),
            _cell(''),
            _cell(''),
            _cell(''),
            _cell(''),
          ],
        ),
      ],
    );
  }

  Widget _header(String text, {bool allowWrap = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 7.5, fontWeight: FontWeight.normal),
        softWrap: allowWrap,
        overflow: allowWrap ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    );
  }

  Widget _cell(
    String text, {
    TextAlign textAlign = TextAlign.left,
    bool allowWrap = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        text,
        textAlign: textAlign,
        style: const TextStyle(fontSize: 7.5, fontWeight: FontWeight.normal),
        softWrap: allowWrap,
        overflow: allowWrap ? TextOverflow.visible : TextOverflow.ellipsis,
      ),
    );
  }
}

// ==================== DATA ====================

final List<Map<String, String>> semester1Courses = [
  {
    "code": "S.CEM101",
    "name": "Харилцааны англи хэл",
    "credit": "3.0",
    "midterm": "93.24",
    "final": "0.0",
    "total": "93.24",
    "letter": "A-",
  },
  {
    "code": "S.CFM100",
    "name": "Програмчлалын үндэс",
    "credit": "3.0",
    "midterm": "70.0",
    "final": "25.0",
    "total": "95.0",
    "letter": "A-",
  },
  {
    "code": "F.CSB101",
    "name": "Мэргэжлийн үдиртгал",
    "credit": "2.0",
    "midterm": "96.0",
    "final": "0.0",
    "total": "96.0",
    "letter": "A",
  },
  {
    "code": "S.MHM101",
    "name": "Монголын түүх",
    "credit": "3.0",
    "midterm": "70.0",
    "final": "30.0",
    "total": "100.0",
    "letter": "A",
  },
  {
    "code": "S.MLM101",
    "name": "Хэл ярианы соёл",
    "credit": "3.0",
    "midterm": "69.0",
    "final": "30.0",
    "total": "99.0",
    "letter": "A",
  },
  {
    "code": "S.MTM121",
    "name": "Математик 1B",
    "credit": "3.0",
    "midterm": "68.0",
    "final": "30.0",
    "total": "98.0",
    "letter": "A",
  },
  {
    "code": "S.PHM101",
    "name": "Физик I",
    "credit": "3.0",
    "midterm": "64.0",
    "final": "25.0",
    "total": "89.0",
    "letter": "B+",
  },
  {
    "code": "F.CSM100",
    "name": "Алгоритмын үндэс",
    "credit": "3.0",
    "midterm": "70.0",
    "final": "30.0",
    "total": "100.0",
    "letter": "A",
  },
];

final List<Map<String, String>> semester2Courses = [
  {
    "code": "S.CDM101",
    "name": "Гамшгаас хамгаалах менежмент",
    "credit": "1.0",
    "midterm": "68.0",
    "final": "29.0",
    "total": "97.0",
    "letter": "A",
  },
  {
    "code": "S.MTM122",
    "name": "Математик 2B",
    "credit": "3.0",
    "midterm": "65.0",
    "final": "28.0",
    "total": "93.0",
    "letter": "A-",
  },
  {
    "code": "S.PTM101",
    "name": "Биеийн тамир",
    "credit": "2.0",
    "midterm": "68.0",
    "final": "27.0",
    "total": "95.0",
    "letter": "A-",
  },
  {
    "code": "F.CSM202",
    "name": "Объект хандлагат программчлал",
    "credit": "3.0",
    "midterm": "62.0",
    "final": "30.0",
    "total": "92.0",
    "letter": "A-",
  },
  {
    "code": "F.EEM200",
    "name": "Цахилгаан ба электрон техникийн үндэс",
    "credit": "3.0",
    "midterm": "64.0",
    "final": "27.0",
    "total": "91.0",
    "letter": "A-",
  },
];

final List<Map<String, String>> semester3Courses = [
  {
    "code": "S.EEM101",
    "name": "Инженерчлэлийн эдийн засаг",
    "credit": "3.0",
    "midterm": "68.0",
    "final": "14.0",
    "total": "82.0",
    "letter": "B-",
  },
  {
    "code": "F.CSB200",
    "name": "Компьютерийн ухааны үндэс",
    "credit": "3.0",
    "midterm": "70.0",
    "final": "30.0",
    "total": "100.0",
    "letter": "A",
  },
  {
    "code": "F.CSM200",
    "name": "Хиймэл оюун ухааны үндэс",
    "credit": "3.0",
    "midterm": "63.0",
    "final": "30.0",
    "total": "93.0",
    "letter": "A-",
  },
  {
    "code": "F.CSB203",
    "name": "Өгөгдлийн бүтэц ба алгоритм",
    "credit": "3.0",
    "midterm": "70.0",
    "final": "27.0",
    "total": "97.0",
    "letter": "A",
  },
  {
    "code": "S.PSM201",
    "name": "Магадлалын онол ба математик статистик",
    "credit": "3.0",
    "midterm": "69.0",
    "final": "26.0",
    "total": "95.0",
    "letter": "A-",
  },
  {
    "code": "F.ITM202",
    "name": "Веб зохиомж",
    "credit": "3.0",
    "midterm": "69.0",
    "final": "28.0",
    "total": "97.0",
    "letter": "A",
  },
];
