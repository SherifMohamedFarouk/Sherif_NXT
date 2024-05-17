import 'package:sherif_nxt_assessment/model/reservations_model/ticket_user_data.dart';

class UserTickets {
  int? ticketId;
  String? seat;
  String? ticketSystemId;
  String? ticketTypeName;
  TicketUserData? ticketUserData;
  String? gate;

  UserTickets(
      {this.ticketId,
        this.seat,
        this.ticketSystemId,
        this.ticketTypeName,
        this.ticketUserData,
        this.gate});

  UserTickets.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    seat = json['seat'];
    ticketSystemId = json['ticket_system_id'];
    ticketTypeName = json['ticket_type_name'];
    ticketUserData = json['ticket_user_data'] != null
        ? TicketUserData.fromJson(json['ticket_user_data'])
        : null;
    gate = json['gate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticket_id'] = ticketId;
    data['seat'] = seat;
    data['ticket_system_id'] = ticketSystemId;
    data['ticket_type_name'] = ticketTypeName;
    if (ticketUserData != null) {
      data['ticket_user_data'] = ticketUserData!.toJson();
    }
    data['gate'] = gate;
    return data;
  }
}