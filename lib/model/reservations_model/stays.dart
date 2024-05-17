import 'package:sherif_nxt_assessment/model/reservations_model/rooms.dart';

class Stays {
  String? name;
  String? description;
  String? lat;
  String? lng;
  String? address;
  String? checkIn;
  String? checkOut;
  int? stars;
  List<String>? stayImages;
  String? amenities;
  List<Rooms>? rooms;

  Stays(
      {this.name,
        this.description,
        this.lat,
        this.lng,
        this.address,
        this.checkIn,
        this.checkOut,
        this.stars,
        this.stayImages,
        this.amenities,
        this.rooms});

  Stays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    stars = json['stars'];
    stayImages = json['stay_images'].cast<String>();
    amenities = json['amenities'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['lat'] = lat;
    data['lng'] = lng;
    data['address'] = address;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['stars'] = stars;
    data['stay_images'] = stayImages;
    data['amenities'] = amenities;
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}