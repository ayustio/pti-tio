class Event {
  final String title;
  final String date;
  final String location;
  final String image;
  final String description;
  final bool isPaid;
  final int? price;

  Event({
    required this.title,
    required this.date,
    required this.location,
    required this.image,
    required this.description,
    this.isPaid = false,
    this.price,
  });
}
