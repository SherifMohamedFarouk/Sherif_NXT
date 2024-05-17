import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/reservation_item_and_list/list_view_reservation_widget.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/reservation_item_and_list/reservation_item.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/title_display_widget.dart';
import '../start_view/provider/provider_reservation.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<GetsReservationProvider>(builder: (context, getReservation , _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/rectangle_36.jpeg',
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: screenWidth,
                        height: 850.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.sp,
                  ),

                  // if conditions to make sure the reservation is not null so no errors acquire
                  if (getReservation.reservationsList != null) ...[
                    if (getReservation.reservationsList!.isEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
                        // custom 2 text in top of each others
                        child: const TitleDisplayWidget(
                            title: "Account has No Reservation",
                            desc: "check again later"),
                      ),
                    ] else if (getReservation.reservationsList!.isNotEmpty &&
                        getReservation.reservationsList?.length == 1) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
                        // custom 2 text in top of each others
                        child: TitleDisplayWidget(
                            title: "Hotel Check-in",
                            desc:
                                "${getReservation.reservationsList![0].stays?.first.name!}"),
                      ),
                      SizedBox(
                        height: 100.sp,
                      ),
                      // the reservation item for if the list length is only 1
                      // it has it own design from if the list have than one item
                      ReservationItem(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        reservationItem: getReservation.reservationsList![0],
                      )
                    ] else if (getReservation.reservationsList!.isNotEmpty) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 50.0.sp, right: 20.0.sp),
                        child: const TitleDisplayWidget(
                            title: "Hotel Check-in", desc: "Multiple Reservations"),
                      ),
                      SizedBox(
                        height: 100.sp,
                      ),
                      // to call list of reservations
                      ListViewReservationWidget(
                          getRegister: getReservation,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight)
                    ],
                  ]
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
