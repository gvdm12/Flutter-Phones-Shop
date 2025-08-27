import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              width: 370,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadiusGeometry.circular(14),
                  ),
                ),
                onPressed: () async {
                  final Uri url = Uri.parse(
                    'https://play.google.com/store/apps?hl=ru',
                  );
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw 'Could not launch $url';
                  }
                },
                child: Text('Оценить приложение'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
