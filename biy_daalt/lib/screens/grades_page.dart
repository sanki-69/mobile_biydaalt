import 'package:flutter/material.dart';

class GradesPage extends StatelessWidget {
  const GradesPage({super.key});

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
          'ДҮНГИЙН МЭДЭЭЛЭЛ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _GradeCard(
            title: "2024-2025 оны намрын улирлын дүнгийн хуудас",
            dateStart: "2025-04-23",
            dateEnd: "2025-08-13",
          ),
          SizedBox(height: 16),
          _GradeCard(
            title: "2024-2025 оны хаврын улирлын дүнгийн хуудас",
            dateStart: "2025-01-06",
            dateEnd: "2025-01-14",
            isLongTitle: true,
          ),
          SizedBox(height: 16),
          _GradeCard(
            title: "2024-2025 оны зуны улирлын дүнгийн хуудас",
            dateStart: "2024-12-09",
            dateEnd: "2024-12-31",
          ),
          SizedBox(height: 16),
          _GradeCard(
            title: "2024-2025 оны хичээлийн жилийн дүнгийн тайлан",
            dateStart: "2024-08-23",
            dateEnd: "2024-08-31",
            isLongTitle: true,
          ),
          SizedBox(height: 16),
          _GradeCard(
            title: "2024-2025 оны улирлын төгсөх хичээлийн дүнгийн тайлан",
            dateStart: "2024-05-10",
            dateEnd: "2024-06-10",
            isLongTitle: true,
          ),
        ],
      ),
    );
  }
}

class _GradeCard extends StatelessWidget {
  final String title;
  final String dateStart;
  final String dateEnd;
  final bool isLongTitle;

  const _GradeCard({
    required this.title,
    required this.dateStart,
    required this.dateEnd,
    this.isLongTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1976D2), // deep blue
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isLongTitle ? Colors.white70 : Colors.white,
              fontSize: isLongTitle ? 13.5 : 15,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                dateStart,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward, color: Colors.white70, size: 16),
              const SizedBox(width: 12),
              Text(
                dateEnd,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF1976D2),
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Харах',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
