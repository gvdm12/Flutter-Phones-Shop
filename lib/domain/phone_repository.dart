import 'package:flutter_phones_shop/data_models/phone.dart';

abstract class PhoneRepository {
  Future<List<Phone>> fetchPhones();
}
