import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../models/event.dart';
import 'event_detail_page.dart';
import 'event_page.dart';
import 'profil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 🔹 Data event sama seperti di EventPage
  final List<Event> events = [
    Event(
      title: "Seminar Nasional Electrical",
      date: "04 Oktober 2025",
      location: "GSG Unila",
      image: "assets/seminarnasional.png",
      description: '''
Seminar Nasional “Electrical Engineering in Action 2025” diselenggarakan oleh Jurusan Teknik Elektro pada tanggal 4 Oktober 2025 di Gedung Serbaguna GSG, Universitas Lampung. 

Mengusung tema “Bangkit Bersama Teknologi: Mewujudkan Indonesia Cerdas, Bersih Energi, Berliterasi Digital, dan Siap Menghadapi Era Kecerdasan Buatan”, acara ini menghadirkan berbagai sesi menarik mulai dari keynote speaker, panel diskusi, hingga workshop.

Sebagai pembicara utama, Sandy Kristian Waluyo — alumnus dan mahasiswa inspiratif dari National University of Singapore — berbagi wawasan tentang sinergi antara teknologi elektro, IoT (Internet of Things), dan energi bersih dalam konteks transformasi digital Indonesia.

Selain Sandy, seminar ini juga diisi oleh pakar nasional lainnya di bidang teknik elektro dan energi, yang membahas topik-topik seperti instalasi pintar, smart grid, robotika, dan implementasi teknologi AI di dunia industri elektro.

Acara terbuka untuk umum, gratis dengan e-sertifikat, dan dihadiri oleh puluhan program studi dari berbagai kampus se-Nusantara. Peserta tidak hanya mengikuti sesi presentasi tetapi juga kompetisi mini, demo teknologi, dan kesempatan networking antar mahasiswa dan profesional di bidang elektro.

Dengan semangat “Teknologi untuk Aksi”, seminar ini bertujuan mendorong mahasiswa Teknik Elektro untuk tidak hanya memahami teori, tetapi juga berkontribusi nyata dalam pengembangan teknologi yang ramah lingkungan dan berdampak sosial.
''',
    ),
    Event(
      title: "Diwangkara Festival",
      date: "10 November 2025",
      location: "Lapangan Teknik Elektro Unila",
      image: "assets/diwangkara.png",
      description:
      "Festival tahunan Teknik Elektro yang menampilkan lomba dan pentas seni mahasiswa.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeContent(context),
      const EventPage(),
      const ProfilPage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF6750A4),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Event Mahasiswa Elektro",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Cari event...",
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    suffixIcon: const Icon(Icons.filter_list, color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Upcoming Events",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // 🔹 Klik event → langsung ke halaman detail sesuai data
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventDetailPage(event: events[1]),
                      ),
                    );
                  },
                  child: const EventCard(
                    title: "Diwangkara Festival",
                    place: "Lapangan Teknik Elektro Unila",
                    imagePath: "assets/diwangkara.png",
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EventDetailPage(event: events[0]),
                      ),
                    );
                  },
                  child: const EventCard(
                    title: "Seminar Nasional Electrical",
                    place: "GSG Unila",
                    imagePath: "assets/seminarnasional.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
