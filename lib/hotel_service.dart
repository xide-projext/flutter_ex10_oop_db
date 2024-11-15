import 'dart:convert';
import 'package:http/http.dart' as http;
import 'hotel.dart';

class HotelService {
  final String baseUrl = 'http://localhost:3003';

  Future<List<Hotel>> fetchHotels() async {
    final response = await http.get(Uri.parse('$baseUrl/hotels'));
    print(response.statusCode); 
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((hotelJson) => Hotel.fromJson(hotelJson)).toList();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
