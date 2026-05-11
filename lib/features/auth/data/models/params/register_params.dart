class RegisterParams {
  final String email;
  final String fullName;
  final String password;

  RegisterParams({
    required this.email,
    required this.fullName,
    required this.password,
  });

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'email': email,
      'fullName': fullName,
      'password': password,
    };
  }
}

class RegisterMerchantParams extends RegisterParams {
  final String merchantName;
  final String commercialRegistration;
  final String taxNumber;

  RegisterMerchantParams({
    required super.email,
    required super.fullName,
    required super.password,
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
