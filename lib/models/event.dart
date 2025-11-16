class Event {
  final int? id;                 // ← tambahkan id
  final String title;
  final String date;
  final String location;
  final String image;
  final String description;
  final bool isPaid;
  final int? price;

  Event({
    this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.image,
    required this.description,
    this.isPaid = false,
    this.price,
  });

  // 🔹 JSON → Dart object
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      location: json['location'],
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      isPaid: json['is_paid'] ?? false,
      price: json['price'],
    );
  }

  // 🔹 Dart object → JSON (untuk POST ke Django)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'location': location,
      'image': image,
      'description': description,
      'is_paid': isPaid,
      'price': price,
    };
  }
}
