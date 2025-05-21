class Booking {
  final String id;
  final String userId;
  final String startTime;
  final String endTime;

  Booking({
    required this.id,
    required this.userId,
    required this.startTime,
    required this.endTime,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['userId'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'startTime': startTime, 'endTime': endTime};
  }
}
