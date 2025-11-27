import 'package:flutter/material.dart';

class ScholarshipPage extends StatelessWidget {
  const ScholarshipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2355C4),
        elevation: 0,
        leading: const BackButton(color: Colors.white), // Flutter back button
        title: const Text(
          'ТЭТГЭЛЭГ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ScholarshipCard(
            title: "2024-2025 оны В улирлын Төгсөгч оюутны анкет",
            dateStart: "2025-04-23",
            dateEnd: "2025-06-13",
          ),
          SizedBox(height: 16),
          _ScholarshipCard(
            title: "2024-2025 намрын улирлын 'Шилдэг, тэргүүний төгсөгч' анкет",
            dateStart: "2025-01-06",
            dateEnd: "2025-01-14",
          ),
          SizedBox(height: 16),
          _ScholarshipCard(
            title: "2024-2025 оны А улирлын Төгсөгч оюутны анкет",
            dateStart: "2025-02-10",
            dateEnd: "2025-02-25",
          ),
          SizedBox(height: 16),
          _ScholarshipCard(
            title:
                "2024-2025 оны хичээлийн жилийн Захирлын нэрэмжит 'Элсэгч' оюутны тэтгэлэг",
            dateStart: "2025-08-23",
            dateEnd: "2025-08-31",
          ),
          SizedBox(height: 16),
          _ScholarshipCard(
            title:
                "2023-2024 оны хичээлийн жилийн хаврын улирлын Захирлын нэрэмжит 'Шилдэг, тэргүүний төгсөгч' тэтгэлэг",
            dateStart: "2024-05-10",
            dateEnd: "2024-06-10",
          ),
        ],
      ),
    );
  }
}

class _ScholarshipCard extends StatelessWidget {
  final String title;
  final String dateStart;
  final String dateEnd;

  const _ScholarshipCard({
    required this.title,
    required this.dateStart,
    required this.dateEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2355C4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          // Dates row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateStart,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              Text(
                dateEnd,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Duussan button below
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Дууссан',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
