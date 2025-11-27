import 'package:flutter/material.dart';

class HicheeliinFilePage extends StatefulWidget {
  final String courseCode;
  final String courseTitle;

  const HicheeliinFilePage({
    super.key,
    this.courseCode = '',
    this.courseTitle = '',
  });

  @override
  State<HicheeliinFilePage> createState() => _HicheeliinFilePageState();
}

class _HicheeliinFilePageState extends State<HicheeliinFilePage> {
  int _selectedTabIndex = 0;
  final List<String> tabs = [
    'Лекц',
    'Семинар',
    'Лаборатори',
    'Практик',
    'Бие даалт',
    'Нэмэлт даалгавар',
    'Бусад',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'ХИЧЭЭЛИЙН ФАЙЛ',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2355C4),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course info
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.courseCode,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.courseTitle,
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
          ),

          // Scrollable tabs
          SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: tabs.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final isSelected = index == _selectedTabIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2355C4)
                          : const Color(0xFFF49D02),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tabs[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 60),

          // Folder icon
          const Center(
            child: Icon(Icons.folder_open, size: 100, color: Color(0xFFBBDEFB)),
          ),

          const SizedBox(height: 30),

          // "Өгөгдөл алга байна"
          const Center(
            child: Text(
              'Өгөгдөл алга байна',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
