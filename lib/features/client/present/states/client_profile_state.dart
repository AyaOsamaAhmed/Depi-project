abstract class ClientProfileState {}

class ClientProfileInitial extends ClientProfileState {}

class ClientProfileLoading extends ClientProfileState {}

class ClientProfileSuccess extends ClientProfileState {
  final String name;
  final String company;
  final String email;
  final String location;
  final String phone;
  final double balance;

  ClientProfileSuccess({
    required this.name,
    required this.company,
    required this.email,
    required this.location,
    required this.phone,
    required this.balance,
  });

  ClientProfileSuccess copyWith({
    String? name,
    String? company,
    String? email,
    String? location,
    String? phone,
    double? balance,
  }) {
    return ClientProfileSuccess(
      name: name ?? this.name,
      company: company ?? this.company,
      email: email ?? this.email,
      location: location ?? this.location,
      phone: phone ?? this.phone,
      balance: balance ?? this.balance,
    );
  }
}

class ClientProfileError extends ClientProfileState {
  final String message;

  ClientProfileError(this.message);
}
