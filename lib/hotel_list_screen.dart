import 'package:flutter/material.dart';
import 'hotel.dart';
import 'hotel_service.dart';

class HotelListScreen extends StatefulWidget {
  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  late Future<List<Hotel>> _hotels;
  final HotelService _hotelService = HotelService();

  @override
  void initState() {
    super.initState();
    _hotels = _hotelService.fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Reservations'),
      ),
      body: FutureBuilder<List<Hotel>>(
        future: _hotels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load hotels'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hotels available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final hotel = snapshot.data![index];
                return ListTile(
                  title: Text(hotel.name),
                  subtitle: Text('${hotel.location} - \$${hotel.price.toStringAsFixed(2)} per night'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // 예약 로직 또는 예약 확인 화면 이동을 구현할 수 있습니다.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reserved ${hotel.name}')),
                      );
                    },
                    child: Text('Reserve'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
