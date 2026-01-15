// import 'package:flutter/material.dart';
// import 'package:mission_4_trip_itennary/models/trip.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: const MyTripList()));
// }

// class MyTripList extends StatelessWidget {
//   const MyTripList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
//       ),
//       home: const TripList(),
//     );
//   }
// }

// class TripList extends StatefulWidget {
//   const TripList({super.key});

//   @override
//   State<TripList> createState() => _TripListState();
// }

// class _TripListState extends State<TripList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Stack(children: [Column()]));
//   }
// }
import 'models/trip.dart';
import 'models/itinerary_item.dart';

void main() {
  final trip = Trip(
    namaTrip: 'LIBURAN JEPANG 2026',
    tanggalMulai: '12 Januari 2026',
    tanggalAkhir: '28 Januari 2026',
  );

  final tripJson = trip.toJson();
  print('Trip ke JSON:');
  print(tripJson);

  final tripFromJson = Trip.fromJson(tripJson);
  print('\nTrip dari JSON:');
  print(tripFromJson.namaTrip);

  // ===============================

  final itinerary = ItineraryItem(
    lokasi: 'KYOTO',
    waktu: 'JAM 8 MALAM',
    catatan: 'Rekomendasi pribadi: jalan malam di Gion',
    idTrip: '12',
  );

  final itineraryJson = itinerary.toJson();
  print('\nItinerary ke JSON:');
  print(itineraryJson);

  final itineraryFromJson = ItineraryItem.fromJson(itineraryJson);

  print('\nItinerary dari JSON:');
  print(itineraryFromJson.lokasi);
}
