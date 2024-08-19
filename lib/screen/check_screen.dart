import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controller/otp_controller.dart';
import 'package:untitled2/screen/otp_is_not_required.dart';
import 'package:untitled2/screen/otp_screen.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  final OtpController otpController = Get.put(OtpController());
  @override
  void initState() {
    super.initState();
    otpController.getOtpScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            if (otpController.isOtpRequired == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Otp(),
                  ));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtpIsNotRequired(),
                  ));
            }
          },
          child: Container(
            height: 50,
            width: 200,
            color: Colors.blueAccent,
            child: Center(child: Text('Get otp')),
          ),
        ),
      ),
    );
  }
}
