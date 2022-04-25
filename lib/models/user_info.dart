class UserDetails {
  String userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userImage;
  String? userDistrict;
  String? userUpazila;
  String? userAddress;

  UserDetails(
      {required this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userImage,
      this.userDistrict,
      this.userUpazila,
      this.userAddress});

  factory UserDetails.fromJson(Map<dynamic, dynamic> json) => UserDetails(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        userImage: json["user_image"],
        userDistrict: json["user_district"],
        userUpazila: json["user_upazila"],
        userAddress: json["user_address"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName ?? '',
        "user_email": userEmail ?? '',
        "user_phone": userPhone ?? '',
        "user_image": userImage ?? '',
        "user_district": userDistrict ?? '',
        "user_upazila": userUpazila ?? '',
        "user_address": userAddress ?? '',
      };
}
