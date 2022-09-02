import 'dart:io';
import 'stdin_raw.dart';

void main() {
  stdout.write('Enter some text (normal mode): ');
  final textNormal = stdin.readLineSync();
  stdout.write('You wrote $textNormal\n\n');

  stdin.rawMode = true;
  stdout.write('Enter some text (raw mode): ');
  final textRaw = stdin.readLineSync();
  stdout.write('You wrote $textRaw\n\n');
  stdin.rawMode = false;
}
