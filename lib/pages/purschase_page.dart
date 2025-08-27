import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PurschasePage extends StatefulWidget {
  const PurschasePage({super.key});

  @override
  State<PurschasePage> createState() => _PurschasePageState();
}

class _PurschasePageState extends State<PurschasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Введите вашу почту',
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45),
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[300],
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Введите вашу банковскую карту',
                hintStyle: TextStyle(fontSize: 13),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 310,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext) {
                    return CupertinoAlertDialog(
                      title: Text(
                        'Серверы недоступны Повторите попытку позже',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Закрыть',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Далее',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 310,
            height: 36,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                ),
              ),
              onPressed: () async {
                final Uri url = Uri.parse(
                  'https://05.ru/catalog/portativ/phones/',
                );
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                'Перейти на сайт',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
