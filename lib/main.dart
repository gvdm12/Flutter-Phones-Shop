import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phones_shop/bloc/phone_bloc.dart';
import 'package:flutter_phones_shop/bloc/phone_event.dart';
import 'package:flutter_phones_shop/data_models/notifiers.dart';
import 'package:flutter_phones_shop/domain/get_phones.dart';
import 'package:flutter_phones_shop/domain/phone_repository.dart';
import 'package:flutter_phones_shop/domain/phone_repository_impl.dart';
import 'package:flutter_phones_shop/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final phoneRepository = PhoneRepositoryImpl();

  runApp(MyApp(phoneRepository: phoneRepository));
}

class MyApp extends StatelessWidget {
  final PhoneRepository phoneRepository;
  const MyApp({super.key, required this.phoneRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PhoneRepositoryImpl(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                PhoneBloc(getPhones: GetPhones(phoneRepository))
                  ..add(LoadPhone()),
          ),
        ],
        child: ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDarKMode, child) {
            return MaterialApp(
              theme: ThemeData(
                brightness: isDarKMode ? Brightness.light : Brightness.dark,
                platform: TargetPlatform.iOS,
              ),
              debugShowCheckedModeBanner: false,
              home: OnboardingPage(),
            );
          },
        ),
      ),
    );
  }
}
