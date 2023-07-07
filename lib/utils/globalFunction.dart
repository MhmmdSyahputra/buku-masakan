import 'dart:math';

import 'package:foodies/utils/data.dart';

String cutText(String text) {
  if (text.length >= 20) {
    return text.substring(0, 110) + '...';
  }
  return text;
}

int generateId() {
  DateTime now = DateTime.now();
  int milliseconds = now.millisecondsSinceEpoch;
  // membuat nilai acak berdasarkan waktu dalam milidetik dan tanggal
  Random random = Random(milliseconds);
  return random.nextInt(100);
}

String randomImage() {
  int index = Random().nextInt(listRandomImage.length);
  return listRandomImage[index]['image'].toString();
}
