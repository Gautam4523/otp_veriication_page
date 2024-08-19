import 'package:get/get.dart';
import 'package:untitled2/model/otp_model.dart';
import 'package:untitled2/network_helper.dart';
import 'package:flutter/material.dart';

class OtpController extends GetxController {
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();
  final TextEditingController textEditingController4 = TextEditingController();

  void getOtpScreen() async {
    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://run.mocky.io/v3/fa25b84a-ad7a-4638-bea6-cfb1ede348d5');
    var value = await networkHelper.getApiResponse();
    print('otp$value');
    OtpModel otpModel = OtpModel.fromJson(value);
    setOtp(otpModel.otp ?? '');
    setIsOtpRequired(otpModel.isOtpRequired ?? false);
  }

  final RxString _otp = RxString('');
  String get otp => _otp.value;

  setOtp(String value) {
    _otp.value = value;
  }

  final RxBool _isOtpRequired = RxBool(false);
  bool get isOtpRequired => _isOtpRequired.value;
  setIsOtpRequired(bool value) {
    _isOtpRequired.value = value;
  }
}
