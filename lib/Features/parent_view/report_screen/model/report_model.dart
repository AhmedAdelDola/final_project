// Define your Report data model
class Report {
  final String id;
  final String name;
  final String date;
  final String content;
  final String type; // "Notes" or "records"
  final String? avatarUrl;

  Report({
    required this.id,
    required this.name,
    required this.date,
    required this.content,
    required this.type,
    this.avatarUrl,
  });
}
