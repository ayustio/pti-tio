import 'package:flutter/material.dart';
import '../models/event.dart';
import 'event_detail_page.dart';
import '../services/event_service.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final EventService _eventService = EventService();

  // 🔹 Event lokal (JANGAN DIUBAH)
  final List<Event> localEvents = [
    Event(
      title: "Seminar Nasional Electrical",
      date: "04 Oktober 2025",
      location: "GSG Unila",
      image: "assets/seminarnasional.png",
      description: '''
Seminar Nasional “Electrical Engineering in Action 2025” diselenggarakan oleh Jurusan Teknik Elektro pada tanggal 4 Oktober 2025 di Gedung Serbaguna GSG, Universitas Lampung. 
''',
    ),
    Event(
      title: "Diwangkara Festival",
      date: "10 November 2025",
      location: "Lapangan Teknik Elektro Unila",
      image: "assets/diwangkara.png",
      description: "Festival tahunan Teknik Elektro...",
    ),
    Event(
      title: "Senam Elektro",
      date: "15 November 2025",
      location: "Halaman Gedung D Elektro",
      image: "assets/senam.webp",
      description: "Kegiatan olahraga pagi...",
    ),
    Event(
      title: "Seminar Nasional IoT",
      date: "20 November 2025",
      location: "Aula Utama Fakultas Teknik",
      image: "assets/seminar.webp",
      description: "Seminar IoT...",
    ),
    Event(
      title: "Workshop AI & IoT",
      date: "25 November 2025",
      location: "Lab Komputer Elektro",
      image: "assets/workshop.jpg",
      description: "Workshop premium...",
      isPaid: true,
      price: 15000,
    ),
  ];

  // 🔹 Event backend
  late Future<List<Event>> futureBackendEvents;

  @override
  void initState() {
    super.initState();
    futureBackendEvents = _eventService.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Event"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Event>>(
        future: futureBackendEvents,
        builder: (context, snapshot) {
          List<Event> allEvents = [...localEvents];

          if (snapshot.hasData) {
            allEvents.addAll(snapshot.data!);
          }

          return ListView.builder(
            itemCount: allEvents.length,
            itemBuilder: (context, index) {
              final event = allEvents[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: ListTile(
                  leading: _buildImage(event),
                  title: Text(event.title),
                  subtitle: Text("${event.date} • ${event.location}"),

                  // 🔥 sekarang bisa dibuka detail page
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
          );
        },
      ),
    );
  }

  // 🔹 Bedakan gambar lokal / URL
  Widget _buildImage(Event event) {
    if (event.image.startsWith("http") || event.image.startsWith("https")) {
      return Image.network(
        event.image,
        width: 70,
        height: 70,
        fit: BoxFit.cover,
        errorBuilder: (context, e, stack) =>
        const Icon(Icons.broken_image, size: 50),
      );
    } else {
      return Image.asset(
        event.image,
        width: 70,
        height: 70,
        fit: BoxFit.cover,
      );
    }
  }
}
