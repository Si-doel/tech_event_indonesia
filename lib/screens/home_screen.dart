import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> events = [
    {
      'title': 'Seminar Teknologi AI 2026',
      'category': 'Seminar',
      'price': 'Gratis',
      'status': 'Pendaftaran Dibuka',
      'date': '25 November 2026',
      'location': 'Auditorium Kampus',
      'image':
          'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
    },
    {
      'title': 'Workshop UI/UX Design',
      'category': 'Workshop',
      'price': 'Rp50.000',
      'status': 'Berbayar',
      'date': '28 November 2026',
      'location': 'Lab Komputer',
      'image':
          'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=800',
    },
    {
      'title': 'TechTalk Cyber Security',
      'category': 'Talkshow',
      'price': 'Gratis',
      'status': 'Pendaftaran Dibuka',
      'date': '5 Desember 2026',
      'location': 'Ruang Seminar',
      'image':
          'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?w=800',
    },
  ];

  String selectedCategory = 'Semua';
  String searchQuery = '';

  final List<String> categories = ['Semua', 'Seminar', 'Workshop', 'Talkshow'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredEvents = events.where((event) {
      final matchesCategory =
          selectedCategory == 'Semua' || event['category'] == selectedCategory;

      final matchesSearch = event['title'].toString().toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DISCOVER',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 3,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'TechEvent Indonesia',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF20243A),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Temukan event teknologi menarik untukmu.',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),

              const SizedBox(height: 22),

              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari event...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6558D3), Color(0xFF9B65DC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'EVENT UNGGULAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Seminar Teknologi AI 2026',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Jelajahi inovasi AI dan masa depan teknologi.',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),

                    const SizedBox(height: 18),

                    ElevatedButton(
                      onPressed: () {
                        final eventUnggulan = events.first;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              event: eventUnggulan,
                              namaEvent: eventUnggulan['title'].toString(),
                              hargaEvent: eventUnggulan['price'].toString(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF6558D3),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Jelajahi Event'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Kategori Event',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF20243A),
                ),
              ),

              const SizedBox(height: 14),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    final isSelected = selectedCategory == category;

                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                        selectedColor: const Color(0xFF6558D3),
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF45465A),
                          fontWeight: FontWeight.w600,
                        ),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Events',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF20243A),
                    ),
                  ),
                  Text(
                    '${filteredEvents.length} Event',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              if (filteredEvents.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text('Event tidak ditemukan.'),
                  ),
                ),

              ...filteredEvents.map((event) {
                return EventCard(
                  event: event,
                  onDetailPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          event: event,
                          namaEvent: event['title'].toString(),
                          hargaEvent: event['price'].toString(),
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void showDetailMessage(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Halaman detail "$title" akan dibuat selanjutnya.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
