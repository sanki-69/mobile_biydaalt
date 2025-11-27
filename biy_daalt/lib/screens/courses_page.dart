import 'package:flutter/material.dart';
import 'udirdamj_page.dart';
import 'hicheel_file_page.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int _selectedDayIndex = 0;
  final List<String> weekdays = [
    'Дав',
    'Мяг',
    'Лха',
    'Пүр',
    'Баа',
    'Бям',
    'Ням',
  ];

  final Map<int, List<Course>> _coursesPerDay = {
    0: [
      Course(
        'F.CSB349',
        'Граф ба машин сургалт',
        'Б. ТУЯАЦЭЦЭГ',
        '1-1',
        'VI-229',
      ),
      Course('F.CSB309', 'Тооцооллын хичээл', 'Н. БАТ-ЭРДЭНЭ', '2-1', 'VI-230'),
    ],
    1: [
      Course(
        'F.CSB312',
        'Программчлалын үндэс',
        'Д. СУХБААТАР',
        '1-1',
        'VI-201',
      ),
      Course('F.CSB320', 'Мэдээллийн бүтэц', 'Г. МӨНХБАТ', '2-1', 'VI-202'),
    ],
    2: [
      Course('F.CSB301', 'Алгоритм', 'Б. САРУУЛ', '1-1', 'VI-203'),
      Course('F.CSB302', 'Мобайл программчлал', 'Ө. СҮХ-ОЧИР', '2-1', 'VI-204'),
      Course('F.CSB303', 'Мэдээлэл ба өгөгдөл', 'Н. ЭРДЭНЭ', '3-1', 'VI-205'),
      Course('F.CSB304', 'Сүлжээний үндэс', 'Л. БАТ', '4-1', 'VI-206'),
    ],
    3: [],
    4: [
      Course('F.CSB305', 'Вэб хөгжүүлэлт', 'Б. ТУЯАЦЭЦЭГ', '1-1', 'VI-207'),
      Course(
        'F.CSB306',
        'Мэдээллийн аюулгүй байдал',
        'Н. БАТ-ЭРДЭНЭ',
        '2-1',
        'VI-208',
      ),
      Course('F.CSB307', 'Хиймэл оюун ухаан', 'Г. МӨНХБАТ', '3-1', 'VI-209'),
    ],
  };

  final Map<int, List<bool>> _expandedPerDay = {};

  @override
  void initState() {
    super.initState();
    for (var day in _coursesPerDay.keys) {
      _expandedPerDay[day] = List.generate(
        _coursesPerDay[day]!.length,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final coursesToday = _coursesPerDay[_selectedDayIndex] ?? [];
    final expandedToday = _expandedPerDay[_selectedDayIndex] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'ХИЧЭЭЛИЙН ХУВААРЬ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Row(
            children: List.generate(weekdays.length, (index) {
              final isSelected = index == _selectedDayIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDayIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF2355C4)
                          : const Color(0xFFF49D02),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      weekdays[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),

          if (coursesToday.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Энэ өдөр хичээл алга',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            )
          else
            ...List.generate(coursesToday.length, (i) {
              final course = coursesToday[i];
              final isExpanded = expandedToday[i];
              final courseColor = i % 2 == 0
                  ? const Color(0xFF2355C4)
                  : const Color(0xFFF49D02);

              return _courseCard(
                _selectedDayIndex,
                i,
                course,
                isExpanded,
                courseColor,
              );
            }),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _courseCard(
    int dayIndex,
    int index,
    Course course,
    bool isExpanded,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: time/location + arrow
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // arrow aligned with top text
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Цаг: ${course.time}  Байрлал: ${course.location}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12, // updated font size
                          ),
                        ),
                        const SizedBox(height: 17),
                        Text(
                          '${course.title} /${course.code}/',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12, // updated font size
                          ),
                        ),
                        const SizedBox(height: 17),
                        Text(
                          course.teacher.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 12, // updated font size
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _expandedPerDay[dayIndex]![index] = !isExpanded;
                      });
                    },
                  ),
                ],
              ),

              if (isExpanded) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    _expandedButton('УДИРДАМЖ', course: course),
                    const SizedBox(width: 12),
                    _expandedButton('ХИЧ.ФАЙЛ', course: course),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _expandedButton(String text, {required Course course}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF2355C4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () {
          if (text == 'УДИРДАМЖ') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UdirdamjPage()),
            );
          } else if (text == 'ХИЧ.ФАЙЛ') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HicheeliinFilePage(
                  courseCode: course.code,
                  courseTitle: course.title,
                ),
              ),
            );
          }
        },
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class Course {
  final String code;
  final String title;
  final String teacher;
  final String time;
  final String location;

  Course(this.code, this.title, this.teacher, this.time, this.location);
}
