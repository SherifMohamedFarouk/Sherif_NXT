import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/reservations_model/reservations.dart';
import 'desc_row_widgets.dart';

class DescWidget extends StatelessWidget {
  const DescWidget({
    super.key, required this.reservationItem,
  });

  final Reservations reservationItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.sp,
        ),
        DescRowWidgets(
          title1: "From",
          title2: "Till",
          desc1: reservationItem.startDate ?? "",
          desc2: reservationItem.endDate ?? "",
        ),
        SizedBox(
          height: 100.sp,
        ),
        DescRowWidgets(
          title1: "Stars",
          title2: "Room Count",
          desc1: "",
          desc2: "${reservationItem.stays?.first.rooms!.length}",
          isStars: true,
          starRating: reservationItem.stays!.first.stars!=null?reservationItem.stays!.first.stars!.toDouble():5.0,
        ),
      ],
    );
  }
}