import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
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
      {
        'title': 'Create Notes',
        'icon': Iconsax.note,
        'color': Color(0xFF4CAF50), // green
      },
      {
        'title': 'Chat',
        'icon': Iconsax.message,
        'color': Color(0xFFFF9800), // orange
      },
      {
        'title': 'About',
        'icon': Iconsax.information,
        'color': Color(0xFF2196F3), // blue
      },
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello Lorem 👋',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Lets get something done today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),


              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          // Banner: 2x2 but with aspect ratio
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.6,
                            child: AspectRatio(
                              aspectRatio: 1, // adjust height
                              child: buildGridItem(gridItems[0], context),
                            ),
                          ),

                          // Item 2 (square)
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 0.8,
                            child: AspectRatio(
                              aspectRatio: 1, // perfect square
                              child: buildGridItem(gridItems[1], context),
                            ),
                          ),

                          // Item 3 (square)
                          StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 0.8,
                            child: AspectRatio(
                              aspectRatio: 1, // perfect square
                              child: buildGridItem(gridItems[2], context),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Announcements
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Announcements',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),

                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: announcements.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Title',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      announcements[index],
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),

                                Text(
                                  DateFormat('hh:mm a').format(now),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(Map<String, dynamic> item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${item['title']} tapped!')));
      },
      child: Container(
        decoration: BoxDecoration(
          color: item['color'].withOpacity(0.1), // soft background
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circle for icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: item['color'],
                shape: BoxShape.circle,
              ),
              child: Icon(item['icon'], size: 26, color: Colors.white),
            ),

            const SizedBox(height: 14),

            // Title
            Text(
              item['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
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
