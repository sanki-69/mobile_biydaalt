import 'package:flutter/material.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  bool showWhiteSheet = false;
  String sheetContent = "";

  final List<Map<String, String>> announcements = const [
    {
      "title":
          "'Оюутнуудын суралцахуйн үр дүн, сэтгэл ханамжийн олон улсын судалгаа 2025'-нд 2,3,4 курсын оюутнууд хамрагдаарай",
      "dateStart": "2025-11-13",
    },
    {
      "title":
          "БЗС-ийн суралтын төлбөрийн хөнгөлөлттэй зээлд 2025-2026 оны хичээлийн жилд нэмж хамрагдах ШУТИС-ийн суралцагчдын анхааралд",
      "dateStart": "2025-11-07",
    },
    {
      "title":
          "Багш, ажилтны хүүхдэд БЗС-аас үзүүлэх суралтын төлбөрийн дэмжлэгт 2025-2026 оны хичээлийн жилд анх удаа хамрагдах ШУТИС-ийн суралцагчдын анхааралд",
      "dateStart": "2025-11-06",
    },
    {
      "title":
          "БЗС-ийн буцалтгүй тусламжид 2025-2026 оны хичээлийн жилд анх удаа хамрагдах ШУТИС-ийн суралцагчдын анхааралд",
      "dateStart": "2025-11-06",
    },
  ];

  void _openSheet(String content) {
    setState(() {
      sheetContent = content;
      showWhiteSheet = true;
    });
  }

  void _closeSheet() {
    setState(() {
      showWhiteSheet = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2355C4),
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'ЗАРЛАЛ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              final ann = announcements[index];
              return Column(
                children: [
                  AnnouncementCard(
                    title: ann["title"]!,
                    dateStart: ann["dateStart"]!,
                    onReadMore: () => _openSheet(ann["title"]!),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),

          // White sheet overlay
          if (showWhiteSheet)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {}, // prevent clicks on background
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: 0.6,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Top bar with X
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: _closeSheet,
                                  ),
                                ],
                              ),
                            ),
                            // Scrollable content
                            Expanded(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  sheetContent,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String dateStart;
  final VoidCallback onReadMore;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.dateStart,
    required this.onReadMore,
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
          Row(
            children: [
              Text(
                dateStart,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: onReadMore,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2355C4),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Дэлгэрэнгүй',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
