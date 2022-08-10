import 'dart:io';
import 'stdin_raw.dart';

void main() {
  stdout.write('Enter some text (normal mode): ');
  stdin.readLineSync();
  stdin.rawMode = true;

  stdout.write('Enter some text (raw mode): ');
  stdin.readLineSync();
  stdin.rawMode = false;
}
