
class TicketUserData {
  String? firstName;
  String? lastName;
  String? avatar;
  bool? isUser;

  TicketUserData({this.firstName, this.lastName, this.avatar, this.isUser});

  TicketUserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    isUser = json['is_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['is_user'] = isUser;
    return data;
  }
}
