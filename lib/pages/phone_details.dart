import 'package:flutter/material.dart';
import 'package:flutter_phones_shop/data_models/phone.dart';
import 'package:flutter_phones_shop/pages/purschase_page.dart';
import 'package:flutter_phones_shop/widgets/phone_card.dart';

class PhoneDetails extends StatelessWidget {
  const PhoneDetails({super.key, required this.phone});
  final Phone phone;

  @override
  Widget build(BuildContext context) {
    final List<String> details = phone.details;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info), Text(' Информация о телефоне')],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              PhoneCard(
                phone: Phone(
                  phone.model,
                  phone.price,
                  phone.gb,
                  phone.imagePath,
                  phone.details,
                ),
                enableNavigation: false,
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: details.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      phone.details[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black87,
                  backgroundColor: Colors.blueGrey[300],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PurschasePage()),
                  );
                },
                child: Text(
                  'Перейти к покупке',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
