import 'package:flutter_phones_shop/data_models/phone.dart';

abstract class PhoneState {}

class PhoneLoading extends PhoneState {}

class PhoneLoaded extends PhoneState {
  final List<Phone> phones;
  PhoneLoaded(this.phones);
}

class PhoneError extends PhoneState {
  final String message;
  PhoneError(this.message);
}
