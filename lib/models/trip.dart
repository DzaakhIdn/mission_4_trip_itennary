import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';


@JsonSerializable()
class Trip {
  String? namaTrip;
  String? tanggalMulai;
  String? tanggalAkhir;

  Trip({
    required this.namaTrip,
    required this.tanggalMulai,
    required this.tanggalAkhir,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
  Map<String, dynamic> toJson() => _$TripToJson(this);
}
