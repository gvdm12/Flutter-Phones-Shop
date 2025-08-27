import 'package:flutter/material.dart';
import 'package:flutter_phones_shop/pages/phone_list.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2B34),
      body: Padding(
        padding: const EdgeInsets.only(top: 36.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Lottie.asset('assets/iPhone.json', fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Покупайте телефоны\nСледите за объявлениями',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 340,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => PhoneList()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      child: Text(
                        'Перейти',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
