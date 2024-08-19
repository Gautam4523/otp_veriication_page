import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/common_widgret/text_field_card.dart';
import 'package:untitled2/controller/otp_controller.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final OtpController otpController = Get.put(OtpController());

  String? number;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpController.textEditingController1.text = '';
    otpController.textEditingController2.text = '';
    otpController.textEditingController3.text = '';
    otpController.textEditingController4.text = '';
  }
  // void initState() {
  //   super.initState();
  //   otpController.getOtpScreen();
  // }

  // void getOtpMethod() async {
  //   final NetworkHelper networkHelper = NetworkHelper(
  //
  //   if (response.statusCode == 200) {
  //     OtpModel otpModel =
  //         OtpModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  //     if (otpModel.otp != null) {
  //       print('otp${otpModel.otp!}');
  //       otpController.setOtp(otpModel.otp!);
  //     }
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  // final otp = '7896';
  @override
  Widget build(BuildContext context) {
    final otpCheck = (otpController.textEditingController1.text +
        otpController.textEditingController2.text +
        otpController.textEditingController3.text +
        otpController.textEditingController4.text);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFieldCard(
                  textEditingController: otpController.textEditingController1,
                  onChange: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context);
                    }
                    number = value;
                  },
                ),
                TextFieldCard(
                  textEditingController: otpController.textEditingController2,
                  onChange: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
                TextFieldCard(
                  textEditingController: otpController.textEditingController3,
                  onChange: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
                TextFieldCard(
                  textEditingController: otpController.textEditingController4,
                  onChange: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context);
                    } else if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (otpController.textEditingController1.text.isNotEmpty &&
                      otpController.textEditingController2.text.isNotEmpty &&
                      otpController.textEditingController3.text.isNotEmpty &&
                      otpController.textEditingController4.text.isNotEmpty) {
                    if (otpCheck == otpController.otp) {
                      print('Otp matched');
                    } else {
                      print('Otp did not matched');
                    }
                  } else {
                    print('please enter the input to proceed');
                  }
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
