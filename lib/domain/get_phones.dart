import 'package:flutter_phones_shop/data_models/phone.dart';
import 'package:flutter_phones_shop/domain/phone_repository.dart';

class GetPhones {
  final PhoneRepository repository;

  GetPhones(this.repository);

  Future<List<Phone>> call() async {
    return await repository.fetchPhones();
  }
}
