import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/presentation/reservation_view/widgets/title_display_widget.dart';

class DescRowWidgets extends StatelessWidget {
  const DescRowWidgets({
    super.key, required this.title1, required this.desc1, this.isStars = false, required this.title2, required this.desc2,  this.starRating = 5,
  });
  final String title1 , desc1,title2 , desc2;
  final bool isStars;
  final double starRating;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 50.0.sp),
          child:  TitleDisplayWidget(title: title1,desc:desc1,isStars: isStars,starRating: starRating, ),
        ),
        SizedBox(width:  isStars?screenWidth *0.26:screenWidth *0.3),
        TitleDisplayWidget(title: title2,desc:desc2,isStars: false,starRating: starRating, ),

      ],
    );
  }
}