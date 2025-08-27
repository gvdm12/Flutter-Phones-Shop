import 'package:flutter_phones_shop/data_models/phone.dart';
import 'package:flutter_phones_shop/domain/phone_repository.dart';

class PhoneRepositoryImpl implements PhoneRepository {
  @override
  Future<List<Phone>> fetchPhones() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      Phone('Apple iPhone 11', 199.0, 256, 'assets/iphone.png', [
        'Battery: 3110mAh',
        'Processor: Apple A13 Bionic',
        'Camera: Dual 12MP Ultra Wide + Wide',
        'Video: 4K, 60 FPS',
        'Display: 6.1" Liquid Retina HD',
        'Face ID',
        'Water resistant (IP68)',
      ]),
      Phone('Apple iPhone 11', 199.0, 512, 'assets/iphone.png', [
        'Battery: 3110mAh',
        'Processor: Apple A13 Bionic',
        'Camera: Dual 12MP Ultra Wide + Wide',
        'Storage: 512GB',
        'Display: 6.1" Liquid Retina HD',
        'Face ID',
        'Wireless charging',
      ]),
      Phone('Apple iPhone 12', 239.0, 128, 'assets/iphone12.png', [
        'Battery: 2815mAh',
        'Processor: Apple A14 Bionic',
        'Camera: Dual 12MP Ultra Wide + Wide',
        'MagSafe support',
        'Display: 6.1" Super Retina XDR OLED',
        '5G connectivity',
        'Ceramic Shield glass',
      ]),
      Phone('Apple iPhone 11 Pro', 229.0, 128, 'assets/iphone11pro.png', [
        'Battery: 3046mAh',
        'Processor: Apple A13 Bionic',
        'Camera: Triple 12MP Ultra Wide + Wide + Telephoto',
        'Video: 4K, 60 FPS',
        'Display: 5.8" Super Retina XDR OLED',
        'Stainless steel frame',
        'Water resistant (IP68)',
      ]),
      Phone('Apple iPhone 15 Pro', 319.0, 256, 'assets/iphone15pro.png', [
        'Battery: 3274mAh',
        'Processor: Apple A17 Pro (3nm)',
        'Camera: Triple 48MP + 12MP + 12MP',
        'ProMotion 120Hz display',
        'Titanium body',
        'USB-C with USB 3 speeds',
        '6.1" Super Retina XDR OLED',
      ]),
      Phone('Apple iPhone 15 Pro Max', 333.0, 256, 'assets/iphone15pro.png', [
        'Battery: 4422mAh',
        'Processor: Apple A17 Pro (3nm)',
        'Camera: Triple 48MP + 12MP + 12MP (5x zoom telephoto)',
        'ProMotion 120Hz display',
        'Titanium body',
        'USB-C with USB 3 speeds',
        '6.7" Super Retina XDR OLED',
      ]),
      Phone('Samsung Galaxy S25', 499.0, 512, 'assets/samsung.jpg', [
        'Battery: 5000mAh',
        'Processor: Snapdragon 8 Gen 4 / Exynos (регионально)',
        'Camera: 200MP + 12MP + 10MP + 10MP',
        'Video: 8K Recording',
        'Display: 6.8" Dynamic AMOLED 2X, 120Hz',
        'Storage: 512GB UFS 4.0',
        'S-Pen support (Ultra)',
      ]),
      Phone('Apple iPhone 12 pro', 259.0, 256, 'assets/iphone12.png', [
        'Battery: 2815mAh',
        'Processor: Apple A14 Bionic',
        'Camera: Triple 12MP Ultra Wide + Wide + Telephoto',
        'LiDAR Scanner',
        'Display: 6.1" Super Retina XDR OLED',
        '5G connectivity',
        'MagSafe support',
        'Ceramic Shield glass',
        'Water resistance: IP68',
      ]),
    ];
  }
}
