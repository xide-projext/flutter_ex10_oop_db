class Hotel {
  final int id;
  final String name;
  final String location;
  final double price;

  Hotel({required this.id, required this.name, required this.location, required this.price});

  // JSON 데이터를 Hotel 객체로 변환하는 팩토리 생성자
  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      price: json['price'].toDouble(),
    );
  }
}
