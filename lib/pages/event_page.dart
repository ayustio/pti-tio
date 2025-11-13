import 'package:flutter/material.dart';
import '../models/event.dart';
import 'event_detail_page.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<Event> events = [
    Event(
      title: "Seminar Nasional Electrical",
      date: "04 Oktober 2025",
      location: "GSG Unila",
      image: "assets/seminarnasional.png",
      description:'''
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
    Event(
      title: "Senam Elektro",
      date: "15 November 2025",
      location: "Halaman Gedung D Elektro",
      image: "assets/senam.webp",
      description:
      "Kegiatan olahraga pagi bersama civitas Teknik Elektro untuk menjaga kesehatan dan kebersamaan.",
    ),
    Event(
      title: "Seminar Nasional IoT",
      date: "20 November 2025",
      location: "Aula Utama Fakultas Teknik",
      image: "assets/seminar.webp",
      description:
      "Seminar teknologi terkini mengenai Internet of Things bersama pakar nasional.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Event"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                event.image,
                width: 70,
                fit: BoxFit.cover,
              ),
              title: Text(event.title),
              subtitle: Text("${event.date} • ${event.location}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventDetailPage(event: event),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
