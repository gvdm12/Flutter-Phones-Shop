import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phones_shop/bloc/phone_bloc.dart';
import 'package:flutter_phones_shop/bloc/phone_event.dart';
import 'package:flutter_phones_shop/bloc/phone_state.dart';
import 'package:flutter_phones_shop/data_models/notifiers.dart';
import 'package:flutter_phones_shop/pages/onboarding_page.dart';
import 'package:flutter_phones_shop/pages/settings_page.dart';
import 'package:flutter_phones_shop/widgets/phone_card.dart';

class PhoneList extends StatelessWidget {
  const PhoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarKMode, child) {
                return Icon(isDarKMode ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Список доступных телефонов',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        backgroundColor: const Color.fromARGB(255, 195, 192, 192),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Text(
                    'Меню',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.phone_iphone),
              title: Text(
                'Телефоны',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_applications_sharp),
              title: Text(
                'Настройки',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Icon(Icons.logout_rounded),
                title: Text(
                  'Выйти',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OnboardingPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<PhoneBloc, PhoneState>(
        builder: (context, state) {
          if (state is PhoneLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (state is PhoneLoaded) {
            return RefreshIndicator.adaptive(
              color: const Color.fromARGB(255, 0, 0, 0),
              onRefresh: () async {
                context.read<PhoneBloc>().add(LoadPhone());
              },
              child: ListView.builder(
                itemCount: state.phones.length,
                itemBuilder: (BuildContext context, int index) {
                  return PhoneCard(
                    phone: state.phones[index],
                    enableNavigation: true,
                  );
                },
              ),
            );
          } else if (state is PhoneError) {
            return Center(child: Text('error : ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
