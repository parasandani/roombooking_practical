import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mindinventory_practical/view/room_booking/room_booking.dart';

import '../../utils/common_colors.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RoomBookingView(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Get started");

    return const Scaffold(
      backgroundColor: CommonColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Room Booking",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: CommonColors.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
