import 'package:flutter/material.dart';
import 'package:flutter_phones_shop/data_models/phone.dart';
import 'package:flutter_phones_shop/pages/phone_details.dart';

class PhoneCard extends StatelessWidget {
  final Phone phone;
  final bool enableNavigation;

  const PhoneCard({
    super.key,
    required this.phone,
    required this.enableNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enableNavigation
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneDetails(phone: phone),
                ),
              );
            }
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white12
                  : Colors.black12,
              blurRadius: 7,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(phone.imagePath, height: 150),
            Text(
              phone.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(children: [Text('${phone.gb.toInt()}GB')]),
                  ],
                ),
                Text(
                  'EUR${phone.price}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
