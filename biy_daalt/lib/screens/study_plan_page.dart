import 'package:flutter/material.dart';

const Color blueLine = Color(0xFF2355C4);

class StudyPlanPage extends StatelessWidget {
  const StudyPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const BackButton(color: Colors.white), // Flutter back button
        title: const Text(
          'СУРГАЛТЫН ТӨЛӨВЛӨГӨӨ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: blueLine,
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              "Дээд боловсролын суурь хичээл",
              "Заавал судлах хичээл",
              requiredFoundationCourses,
            ),
            const SizedBox(height: 32),
            _buildSection(
              "Дээд боловсролын суурь хичээл",
              "Сонгон судлах хичээл",
              electiveFoundationCourses,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    String subtitle,
    List<Map<String, String>> courses,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        _buildTable(courses),
      ],
    );
  }

  Widget _buildTable(List<Map<String, String>> courses) {
    return Column(
      children: [
        // Table header
        Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: const [
              Expanded(
                flex: 2,
                child: Text(
                  "Хич.код",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  "Хич.Нэр",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Кредит",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Улирал",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Төлөв",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        // Rows
        Column(
          children: courses.asMap().entries.map((entry) {
            int idx = entry.key;
            Map<String, String> course = entry.value;
            Color statusColor = course["status"] == "Үзсэн"
                ? Colors.green
                : Colors.red;

            return Column(
              children: [
                Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          course["code"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          course["name"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          course["credit"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          course["semester"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          course["status"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (idx != courses.length - 1)
                  Container(height: 1, color: blueLine),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ------------------ DATA ------------------
final List<Map<String, String>> requiredFoundationCourses = [
  {
    "code": "F.CSB101",
    "name": "Мэргэжлийн үдиртгал",
    "credit": "2.0-кр",
    "semester": "Намар",
    "status": "Үзсэн",
  },
  {
    "code": "F.CSM101",
    "name": "Програмчлалын үндсэн аргауд",
    "credit": "3.0-кр",
    "semester": "Хаврын",
    "status": "Үзсэн",
  },
  {
    "code": "S.CDM101",
    "name": "Гамшгаас хамгаалах менежмент",
    "credit": "1.0-кр",
    "semester": "Дурын",
    "status": "Үзсэн",
  },
  {
    "code": "S.CEM101",
    "name": "Харилцааны англи хэл",
    "credit": "3.0-кр",
    "semester": "Хаврын",
    "status": "Үзсэн",
  },
  {
    "code": "S.CFM100",
    "name": "Програмчлалын үндэс",
    "credit": "3.0-кр",
    "semester": "Намар",
    "status": "Үзсэн",
  },
  {
    "code": "S.EEM101",
    "name": "Инженерчлэлийн эдийн засаг",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзсэн",
  },
  {
    "code": "S.MHM101",
    "name": "Монголын түүх",
    "credit": "3.0-кр",
    "semester": "Хаврын",
    "status": "Үзсэн",
  },
  {
    "code": "S.MLM101",
    "name": "Хэл ярианы соёл",
    "credit": "3.0-кр",
    "semester": "Намар",
    "status": "Үзсэн",
  },
  {
    "code": "S.MTM121",
    "name": "Математик 1B",
    "credit": "3.0-кр",
    "semester": "Намар",
    "status": "Үзсэн",
  },
  {
    "code": "S.MTM122",
    "name": "Математик 2B",
    "credit": "3.0-кр",
    "semester": "Хаврын",
    "status": "Үзсэн",
  },
  {
    "code": "S.PHM101",
    "name": "Физик I",
    "credit": "3.0-кр",
    "semester": "Намар",
    "status": "Үзсэн",
  },
  {
    "code": "S.PTM101",
    "name": "Биеийн тамир",
    "credit": "2.0-кр",
    "semester": "Дурын",
    "status": "Үзсэн",
  },
];

final List<Map<String, String>> electiveFoundationCourses = [
  {
    "code": "F.CSM100",
    "name": "Алгоритмын үндэс",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.ACM101",
    "name": "Аналитик хими",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.AEM101",
    "name": "Гоо зүй",
    "credit": "2.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.CAM101",
    "name": "Хэрэглээний хими",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.CFM101",
    "name": "Алгоритм ба программчлал",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.CLM101",
    "name": "Хятад хэл I",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.CLM102",
    "name": "Хятад хэл II",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.CSM101",
    "name": "Соёл судлал",
    "credit": "2.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.DGM101",
    "name": "Дүрслэх геометр",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.DGM102",
    "name": "Дүрслэх геометр",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.DGM103",
    "name": "Архитектурын дүрслэх геометр",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.DSM101",
    "name": "Өгөгдлийн аналитик",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.EEM102",
    "name": "Инженерийн ёс зүй",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.EGM101",
    "name": "Экологи, байгаль хамгаалал",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.EGM111",
    "name": "Инженерийн англи хэл I",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.ETM100",
    "name": "Эдийн засгийн онолын үндэс",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.GCM101",
    "name": "Ерөнхий хими",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
  {
    "code": "S.GLM101",
    "name": "Герман хэл I",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзсэн",
  },
  {
    "code": "S.GLM102",
    "name": "Герман хэл II",
    "credit": "3.0-кр",
    "semester": "Дурын",
    "status": "Үзээгүй",
  },
];
