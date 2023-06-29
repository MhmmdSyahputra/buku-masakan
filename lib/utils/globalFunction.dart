import 'dart:math';

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
