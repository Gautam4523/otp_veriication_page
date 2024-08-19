class OtpModel {
  final String? otp;
  final bool? isOtpRequired;

  OtpModel({this.otp, this.isOtpRequired});

  OtpModel.fromJson(Map<String, dynamic> json)
      : otp = json['otp'] as String?,
        isOtpRequired = json['is_otp_required'] as bool?;

  Map<String, dynamic> toJson() => {
        'otp': otp,
        'is_otp_required': isOtpRequired,
      };
}
