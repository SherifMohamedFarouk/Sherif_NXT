import 'guests.dart';

class Rooms {
  String? roomNumber;
  int? roomCapacity;
  String? roomTypeName;
  String? stayName;
  List<Guests>? guests;

  Rooms(
      {this.roomNumber,
        this.roomCapacity,
        this.roomTypeName,
        this.stayName,
        this.guests});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomNumber = json['room_number'];
    roomCapacity = json['room_capacity'];
    roomTypeName = json['room_type_name'];
    stayName = json['stay_name'];
    if (json['guests'] != null) {
      guests = <Guests>[];
      json['guests'].forEach((v) {
        guests!.add(Guests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['room_number'] = roomNumber;
    data['room_capacity'] = roomCapacity;
    data['room_type_name'] = roomTypeName;
    data['stay_name'] = stayName;
    if (guests != null) {
      data['guests'] = guests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}