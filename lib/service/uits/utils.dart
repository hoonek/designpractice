import 'dart:math';
import 'package:intl/intl.dart';

class Utils {
  static String generateRandomString(int length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();

    return DateFormat('yyyyMMddHHmmss').format(DateTime.now()) +
        String.fromCharCodes(Iterable.generate(
          length,
          (_) => characters.codeUnitAt(random.nextInt(characters.length)),
        ));
  }
}
