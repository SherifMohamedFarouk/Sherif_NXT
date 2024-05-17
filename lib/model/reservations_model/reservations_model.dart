import 'package:sherif_nxt_assessment/model/reservations_model/reservations.dart';

class ReservationsModel {
  List<Reservations>? reservations;

  ReservationsModel({this.reservations});

  ReservationsModel.fromJson(Map<String, dynamic> json) {
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(Reservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reservations != null) {
      data['reservations'] = reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
