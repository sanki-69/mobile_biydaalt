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
  final List<String> weekdays = ['Дав', 'Мяг', 'Лха', 'Пүр', 'Баа', 'Бям', 'Ням'];

  // Courses per day
  final Map<int, List<Course>> _coursesPerDay = {
    0: [ // Monday
      Course('F.CSB349', 'Граф ба машин сургалт', 'Багш: Б. ТУЯАЦЭЦЭГ'),
      Course('F.CSB309', 'Тооцооллын хичээл', 'Багш: Н. БАТ-ЭРДЭНЭ'),
    ],
    1: [ // Tuesday
      Course('F.CSB312', 'Программчлалын үндэс', 'Багш: Д. СУХБААТАР'),
      Course('F.CSB320', 'Мэдээллийн бүтэц', 'Багш: Г. МӨНХБАТ'),
    ],
    2: [ // Wednesday
      Course('F.CSB301', 'Алгоритм', 'Багш: Б. САРУУЛ'),
      Course('F.CSB302', 'Мобайл программчлал', 'Багш: Ө. СҮХ-ОЧИР'),
      Course('F.CSB303', 'Мэдээлэл ба өгөгдөл', 'Багш: Н. ЭРДЭНЭ'),
      Course('F.CSB304', 'Сүлжээний үндэс', 'Багш: Л. БАТ'),
    ],
    3: [], // Thursday - no courses
    4: [ // Friday
      Course('F.CSB305', 'Вэб хөгжүүлэлт', 'Багш: Б. ТУЯАЦЭЦЭГ'),
      Course('F.CSB306', 'Мэдээллийн аюулгүй байдал', 'Багш: Н. БАТ-ЭРДЭНЭ'),
      Course('F.CSB307', 'Хиймэл оюун ухаан', 'Багш: Г. МӨНХБАТ'),
    ],
  };

  // Track expanded state for each course dynamically
  final Map<int, List<bool>> _expandedPerDay = {};

  @override
  void initState() {
    super.initState();
    // Initialize expanded states for each day
    for (var day in _coursesPerDay.keys) {
      _expandedPerDay[day] = List.generate(_coursesPerDay[day]!.length, (_) => false);
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
          // Weekday Selector
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
                      color: isSelected ? Colors.blue : Colors.orange,
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

          // Courses
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

              // Alternate color between blue and orange
              final courseColor = i % 2 == 0 ? Colors.blue : Colors.orange;

              return _courseCard(_selectedDayIndex, i, course, isExpanded, courseColor);
            }),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _courseCard(int dayIndex, int index, Course course, bool isExpanded, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: title + arrow
              Row(
                children: [
                  Expanded(
                    child: Text(
                      course.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
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
              const SizedBox(height: 8),
              Text(
                course.code,
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                course.teacher,
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),

              if (isExpanded) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    _expandedButton('УДИРДАМЖ'),
                    const SizedBox(width: 12),
                    _expandedButton('ХИЧ.ФАЙЛ'),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _expandedButton(String text) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          if (text == 'УДИРДАМЖ') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UdirdamjPage()),
            );
          } else if (text == 'ХИЧ.ФАЙЛ') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HicheelFilePage()),
            );
          }
        },
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class Course {
  final String code;
  final String title;
  final String teacher;

  Course(this.code, this.title, this.teacher);
}
