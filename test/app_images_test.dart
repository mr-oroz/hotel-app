import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.closeSquare).existsSync(), isTrue);
    expect(File(AppImages.emojiHappy).existsSync(), isTrue);
    expect(File(AppImages.hotel1).existsSync(), isTrue);
    expect(File(AppImages.hotel2).existsSync(), isTrue);
    expect(File(AppImages.success).existsSync(), isTrue);
    expect(File(AppImages.tickSquare).existsSync(), isTrue);
  });
}
