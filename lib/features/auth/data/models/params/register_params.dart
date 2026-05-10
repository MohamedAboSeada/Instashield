class RegisterParams {
  final String email;
  final String phoneNumber;
  final String fullName;
  final String password;
  final String nationalId;

  RegisterParams({
    required this.email,
    required this.phoneNumber,
    required this.fullName,
    required this.password,
    required this.nationalId,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'email': email,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'password': password,
      'nationalId': nationalId,
    };
  }
}

class RegisterMerchantParams extends RegisterParams {
  final String merchantName;
  final String commercialRegistration;
  final String taxNumber;

  RegisterMerchantParams({
    required super.email,
    required super.phoneNumber,
    required super.fullName,
    required super.password,
    required super.nationalId,
    required this.merchantName,
    required this.commercialRegistration,
    required this.taxNumber,
  });

  @override
  Map<String, Object?> toMap() {
    return {
      ...super.toMap(),
      "merchantName": merchantName,
      "commercialRegistration": commercialRegistration,
      "taxNumber": taxNumber,
    };
  }
}
