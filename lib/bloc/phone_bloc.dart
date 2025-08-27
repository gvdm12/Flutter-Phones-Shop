import 'package:bloc/bloc.dart';
import 'package:flutter_phones_shop/bloc/phone_event.dart';
import 'package:flutter_phones_shop/bloc/phone_state.dart';
import 'package:flutter_phones_shop/domain/get_phones.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  final GetPhones getPhones;
  PhoneBloc({required this.getPhones}) : super(PhoneLoading()) {
    on<LoadPhone>((event, emit) async {
      emit(PhoneLoading());
      try {
        final phones = await getPhones.call();
        emit(PhoneLoaded(phones));
      } catch (e) {
        emit(PhoneError(e.toString()));
      }
    });
  }
}
