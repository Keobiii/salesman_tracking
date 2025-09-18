import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime today;
  late List<DateTime> weekDates;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    today = DateTime.now();
    _generateWeek(today);
  }

  void _generateWeek(DateTime date) {
    // Start from today
    DateTime startDay = date;

    // Generate 4 days: today + next 3 days
    weekDates = List.generate(
      4,
      (index) => startDay.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String monthName = DateFormat('MMMM yyyy').format(now);

    final List<Map<String, dynamic>> gridItems = const [
      {'title': 'Notes', 'icon': Icons.note},
      {'title': 'About', 'icon': Icons.info},
      {'title': 'Team', 'icon': Icons.group},
      {'title': 'Tracking', 'icon': Icons.location_on},
    ];

    final List<String> announcements = const [
      'Meeting at 3 PM',
      'John checked in at HQ',
      'New company policy released',
      'Project deadline approaching',
      'Project deadline approaching',
      'Project deadline approaching',
      'Project deadline approaching',
    ];

    return Scaffold(
  backgroundColor: Colors.grey[100],
  body: SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sticky Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blue[300],
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/avatar/user1.png'),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello 👋',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Grid 2x2
                GridView.builder(
                  shrinkWrap: true, // lets GridView take only needed height
                  physics: const NeverScrollableScrollPhysics(), // prevent inner scroll
                  itemCount: gridItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final item = gridItems[index];
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item['title']} tapped!')),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              size: 48,
                              color: Colors.blueAccent,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),

                // Announcements
                const Text(
                  'Announcements',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true, // take only needed height
                  itemCount: announcements.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        announcements[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20), // optional padding at bottom
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

  }

  Row _dateRow() {
    return Row(
      children: weekDates.map((d) {
        bool isToday =
            d.day == today.day &&
            d.month == today.month &&
            d.year == today.year;

        return Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 4,
            ), // spacing between boxes
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 8,
            ), // flexible sizing
            decoration: BoxDecoration(
              color: isToday ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMM').format(d), // Sep, Oct, etc.
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '${d.day}', // 2, 3, 4...
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  DateFormat('EEE').format(d), // Mon, Tue...
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Row _summaryContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Total Agents Container
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Total Agents',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  '150',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),

        // Total Active Agents Container
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Active Agents',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                Text(
                  '120',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Expanded buildHomeContainers() {
    // Example data for your home page
    final List<Map<String, dynamic>> containerData = [
      {'title': 'Sales', 'subtitle': 'Daily report', 'color': Colors.blue[300]},
      {
        'title': 'Inventory',
        'subtitle': 'Stock levels',
        'color': Colors.green[300],
      },
      {
        'title': 'Support',
        'subtitle': 'Open tickets',
        'color': Colors.orange[300],
      },
      {
        'title': 'Analytics',
        'subtitle': 'Weekly stats',
        'color': Colors.purple[300],
      },
    ];

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: containerData.length,
        itemBuilder: (context, index) {
          final item = containerData[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.only(
              bottom: 35,
              top: 35,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: item['color'],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Icon or avatar for illustration
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: Icon(
                    Icons.folder, // example icon
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                // Title & Subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['subtitle'],
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // Optional: arrow icon
                Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
