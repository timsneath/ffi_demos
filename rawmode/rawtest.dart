import 'dart:io';
import 'stdin_raw.dart';

void main() {
  stdout.write('Enter some text (normal mode): ');
  final textNormal = stdin.readLineSync();
  stdin.rawMode = true;
  stdout.write('You wrote $textNormal\n\n');

  stdout.write('Enter some text (raw mode): ');
  final textRaw = stdin.readLineSync();
  stdin.rawMode = false;
  stdout.write('You wrote $textRaw\n\n');
}
