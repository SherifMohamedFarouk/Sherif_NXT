// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sherif_nxt_assessment/presentation/start_view/widgets/bottom_sheet_navigate.dart';
import 'package:sherif_nxt_assessment/presentation/start_view/widgets/theme_switch.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150.sp,
              ),
              // theme switch screen to switch between light and dark
              const ThemeSwitch(),
              SizedBox(
                height: screenHeight * 0.5,
              ),
              // this have all the buttons design that opens the bottom sheets
              BottomSheetsNavigateButtons(screenWidth: screenWidth,screenHeight: screenHeight,)
            ],
          ),
        ),
      ),
    );
  }



}
