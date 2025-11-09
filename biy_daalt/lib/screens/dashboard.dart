import 'package:flutter/material.dart';

// Import your screens for other pages
import 'courses_page.dart';
import 'finance_page.dart';
import 'profile_page.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<String> _labels = ['Нүүр', 'Сургалт', 'Санхүү', 'Профайл'];
  final List<IconData> _icons = [
    Icons.home,
    Icons.school,
    Icons.account_balance_wallet,
    Icons.settings
  ];

  // Pages for other footer buttons
  final List<Widget> _pages = const [
    SizedBox(), // Placeholder for home, because home content is inside DashboardScreen
    CoursesPage(),
    FinancePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: _currentIndex == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Сайн байна уу?',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Эрдэнэ Т. ТҮВШИНСАНАА',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : Text(
                _labels[_currentIndex],
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Show home content when on index 0
          _currentIndex == 0
              ? SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'lib/assets/SHUTIS_logo_banner.jpg',
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Мэдээ, мэдээлэл',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: const Text(
                                    'text',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'lib/assets/news_image.jpg',
                                    width: 80,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Чухал холбоос',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _linkItem(Icons.assessment, 'Дүнгийн\nмэдээлэл'),
                            _linkItem(Icons.school, 'Сургалтын\nтөлөвлөгөө'),
                            _linkItem(Icons.calendar_today, 'Тэтгэлэг'),
                            _linkItem(Icons.announcement, 'Зарлал'),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Энэ улиралд судалж буй хичээлүүд',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        _courseWithCircles('F.CSB349', 'Граф ба машин сургалт',
                            'Багш: Б. ТУЯАЦЭЦЭГ', Colors.blue),
                        _courseWithCircles('F.CSB309', 'Тооцооллын хичээл',
                            'Багш: Н. БАТ-ЭРДЭНЭ', Colors.orange),
                            _courseWithCircles('F.CSB349', 'Граф ба машин сургалт',
                            'Багш: Б. ТУЯАЦЭЦЭГ', Colors.blue),
                        _courseWithCircles('F.CSB309', 'Тооцооллын хичээл',
                            'Багш: Н. БАТ-ЭРДЭНЭ', Colors.orange),
                            _courseWithCircles('F.CSB349', 'Граф ба машин сургалт',
                            'Багш: Б. ТУЯАЦЭЦЭГ', Colors.blue),
                        _courseWithCircles('F.CSB309', 'Тооцооллын хичээл',
                            'Багш: Н. БАТ-ЭРДЭНЭ', Colors.orange),
                            _courseWithCircles('F.CSB349', 'Граф ба машин сургалт',
                            'Багш: Б. ТУЯАЦЭЦЭГ', Colors.blue),
                        _courseWithCircles('F.CSB309', 'Тооцооллын хичээл',
                            'Багш: Н. БАТ-ЭРДЭНЭ', Colors.orange),
                      ],
                    ),
                  ),
                )
              : _pages[_currentIndex], // Show other pages for other tabs

          // Floating Footer Navigation Bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _icons[index],
                          color: _currentIndex == index ? Colors.blue : Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _labels[index],
                          style: TextStyle(
                              color: _currentIndex == index ? Colors.blue : Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- 🔗 Reusable Link Item ---
  Widget _linkItem(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.orange, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // --- 📘 Course Card with horizontal colored circles outside ---
  Widget _courseWithCircles(
      String code, String title, String teacher, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: color, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Card(
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      teacher,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
