// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:sherif_nxt_assessment/core/theme/color_palete.dart';
import 'package:sherif_nxt_assessment/core/theme/provider_theme/change_theme/theme_view_model.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/reservations.dart';
import 'package:sherif_nxt_assessment/model/reservations_model/user_tickets.dart';
import '../../reservation_view/reservation_view.dart';
import '../provider/provider_reservation.dart';
import 'custom_button_ticket.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as bottom;

class BottomSheetsNavigateButtons extends StatelessWidget {
  const BottomSheetsNavigateButtons(
      {Key? key, required this.screenWidth, required this.screenHeight})
      : super(key: key);
  final double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    final getTheme = Provider.of<ThemeViewModel>(context, listen: false);
    return Column(
      children: [
        CustomButtonWidget(
          screenWidth: screenWidth,
          style: Theme.of(context).textTheme.bodyLarge!,
          text: 'Open Reservation',
          onTap: () async {
            await getReservationRequest(context);
            bottom.showBarModalBottomSheet(
              expand: true,
              context: context,
              barrierColor: barrierWhite,
              backgroundColor: Colors.transparent,
              builder: (context) => const ReservationView(),
            );
          },
        ),
        CustomButtonWidget(
          screenWidth: screenWidth,
          style: Theme.of(context).textTheme.displayLarge!,
          isBorder: true,
          text: 'Show IOS Ticket',
          onTap: () {
            showBottomSheetIos(context, getTheme);
          },
        ),
        SizedBox(
          height: 30.sp,
        ),
        CustomButtonWidget(
          screenWidth: screenWidth,
          style: Theme.of(context).textTheme.displayLarge!,
          isBorder: true,
          text: 'Show Android Ticket',
          onlyText: true,
          onTap: () {
            showBottomSheetAndroid(context, getTheme);
          },
        ),
        SizedBox(
          height: 150.sp,
        ),
      ],
    );
  }

  // Android button if platform android it will call the method chanel of not toast that say wrong platform
  Future<void> showBottomSheetAndroid(
      BuildContext context, ThemeViewModel viewModel) async {
    if (Platform.isAndroid) {
      _platformBridgingMethodChannel(context, viewModel);
    } else {
      Fluttertoast.showToast(
          msg: "This bottom sheet are available only on Android platform.");
    }
  }

  // ios button if platform ios it will call the method chanel of not toast that say wrong platform
  Future<void> showBottomSheetIos(
      BuildContext context, ThemeViewModel viewModel) async {
    if (Platform.isIOS) {
      _platformBridgingMethodChannel(context, viewModel);
    } else {
      Fluttertoast.showToast(
          msg: "This bottom sheet are available only on IOS platform.");
    }
  }

  // platform chanel that has method chanel and parameters from the api to show the ticket
  _platformBridgingMethodChannel(
      BuildContext context, ThemeViewModel viewModel) async {
    // data from api or cached data
    List<Reservations>? resList = await getReservationRequest(context);
    List<UserTickets>? ticketsList = resList?.first.userTickets;
    // method channel to link with ios or android platform.
    const MethodChannel channel =
        MethodChannel('com.example.sherif_nxt_assessment/bottomSheet');
    //invoke methode with parmeters that we need for the ticket and theme dark or light
    channel.invokeMethod('showBottomSheet', {
      'name':
          "${ticketsList?.first.ticketUserData?.firstName} ${ticketsList?.first.ticketUserData?.lastName}",
      'image': "${ticketsList?.first.ticketUserData?.avatar}",
      'id': "${ticketsList?.first.ticketId}",
      'type': "Ticket Type: ${ticketsList?.first.ticketTypeName}",
      'seat':
          "Seat:  gate ${ticketsList?.first.gate} / seat ${ticketsList?.first.seat}",
      'isDark': viewModel.getTheme! ? false : true,
    });
  }

  // data from api or cached data to get all the reservations
  Future getReservationRequest(BuildContext context) async {
    final requestData =
        Provider.of<GetsReservationProvider>(context, listen: false);
    context.loaderOverlay.show();
    try {
      final result = await requestData.getAllReservationsProvider();
      context.loaderOverlay.hide();
      return result;
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      context.loaderOverlay.hide();
    }
  }
}
