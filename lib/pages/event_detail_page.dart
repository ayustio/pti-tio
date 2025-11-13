import 'package:flutter/material.dart';
import '../models/event.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class EventDetailPage extends StatefulWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool _isPaying = false;
  bool _isPaid = false;

  Future<void> _openWhatsApp() async {
    final Uri wa = Uri.parse(
      'https://wa.me/6281234567890?text=Halo%20saya%20sudah%20membayar%20event%20${Uri.encodeComponent(widget.event.title)}.',
    );

    if (!await launchUrl(wa, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal membuka WhatsApp")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(event.image, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title,
                      style:
                      const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("${event.date} • ${event.location}",
                      style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  Text(event.description, textAlign: TextAlign.justify),
                  const SizedBox(height: 20),

                  // 🔹 Jika event berbayar, tampilkan tombol bayar
                  if (event.isPaid) ...[
                    if (!_isPaying && !_isPaid)
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() => _isPaying = true);
                        },
                        icon: const Icon(Icons.payment),
                        label: Text("Bayar Rp ${event.price}"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                      ),

                    // 🔹 QRIS Muncul setelah klik bayar
                    if (_isPaying && !_isPaid)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Image.asset(
                            "assets/qris.png",
                            width: 250,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _isPaid = true;
                                _isPaying = false;
                              });
                            },
                            icon: const Icon(Icons.check_circle_outline),
                            label: const Text("Saya sudah bayar"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                          ),
                        ],
                      ),

                    // 🔹 Tampilkan tombol WA setelah bayar
                    if (_isPaid)
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "✅ Pembayaran berhasil!",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: _openWhatsApp,
                            icon: const FaIcon(FontAwesomeIcons.whatsapp),

                            label: const Text("Konfirmasi via WhatsApp"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                            ),
                          ),
                        ],
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
