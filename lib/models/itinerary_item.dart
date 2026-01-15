import 'package:json_annotation/json_annotation.dart';

part 'itinerary_item.g.dart';

@JsonSerializable()
class ItineraryItem {
  String? lokasi;
  String? waktu;
  String? catatan;
  String? idTrip;

  ItineraryItem({this.lokasi, this.waktu, this.catatan, this.idTrip});

  factory ItineraryItem.fromJson(Map<String, dynamic> json) =>
      _$ItineraryItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItineraryItemToJson(this);
}
