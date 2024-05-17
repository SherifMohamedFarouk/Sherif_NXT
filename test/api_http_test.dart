import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations_model.dart';
import 'package:sherif_nxt_assessment/network/network_helper_http.dart';
import 'mock_http_client.dart';


void main() {

  group('getTestHttpGet', () {
    final mockHTTPClientSuccess = MockClient((request) async {
      // Create sample response of the HTTP call //
      final response = {
        "reservations": [
          {
            "id": 82,
            "start_date": "2023-06-23",
            "end_date": "2023-06-25",
            "stays": [
              {
                "name": "Marriott",
                "description": "<p>Marriott <strong>great</strong> <em>holdiay</em></p>",
                "lat": "30.29731276449795",
                "lng": "31.22095413193672",
                "address": "Saray El, Gezira St, Omar Al Khayam, Zamalek, Cairo Governorate 11211, Egypt",
                "check_in": "14:00",
                "check_out": "12:00",
                "stars": 5,
                "stay_images": [
                  "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/89/76/94/pool--v9513198.jpg?w=700&h=-1&s=1",
                  "https://cache.marriott.com/marriottassets/marriott/CAIEG/caieg-exterior-0218-hor-feat.jpg"
                ],
                "amenities": "Swimming pool, Continental breakfast, and Spa",
                "rooms": [
                  {
                    "room_number": "2",
                    "room_capacity": 3,
                    "room_type_name": "Roomy",
                    "stay_name": "Marriott",
                    "guests": [
                      {
                        "first_name": "Ahmed",
                        "last_name": "Mohammed",
                        "avatar": "https://res.cloudinary.com/swtchcc/image/upload/c_scale,w_2800/ar_3:4,c_thumb,g_face,h_1512,z_0.80/v1682589758/userDocs/hvzsye0h3w8f6ud1cuwj.jpg"
                      }
                    ]
                  }
                ]
              },
            ],
            "user_tickets": [
              {
                "ticket_id": 7,
                "seat": "33",
                "ticket_system_id": "RSW3123123",
                "ticket_type_name": "Golden",
                "ticket_user_data": {
                  "first_name": "Ahmed",
                  "last_name": "Ali",
                  "avatar": "https://res.cloudinary.com/swtchcc/image/upload/c_scale,w_2800/ar_3:4,c_thumb,g_face,h_1512,z_0.80/v1682589758/userDocs/hvzsye0h3w8f6ud1cuwj.jpg",
                  "is_user": true
                },
                "gate": "55"
              },
            ]
          },
        ]
      };
      return Response(jsonEncode(response), 200);
    });
    test('try mock http reservations when http response is successful',
            () async {

          // Mock the API call to return a json response with http status 200 Ok //
          ReservationsModel  mockModel= await NetworkHelperMockHttp(mockHTTPClientSuccess).get();
          expect(mockModel, isA<ReservationsModel>());
        });

    test('try real http reservations when http response is successful',
            () async {

          // real  the API call to return a json response with http status 200 Ok //
          var data = jsonDecode(await NetworkHelperHttp().get("/mobile-guests/user-events"));
          ReservationsModel  realModel= ReservationsModel.fromJson(data);
          expect(realModel, isA<ReservationsModel>());
        });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClientError = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(await NetworkHelperMockHttp(mockHTTPClientError).get(),
          "Error Acquired");
    });
  });
}