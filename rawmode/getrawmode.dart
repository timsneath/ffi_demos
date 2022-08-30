// ignore_for_file: unused_local_variable

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'stdin_raw.dart';

void printConsoleFlags(int flags) {
  print('Echo: ${flags & ENABLE_ECHO_INPUT == ENABLE_ECHO_INPUT}');
  print('Line input: ${flags & ENABLE_LINE_INPUT == ENABLE_LINE_INPUT}');
  print(
      'Process input: ${flags & ENABLE_PROCESSED_INPUT == ENABLE_PROCESSED_INPUT}');
  print(
      'Quick edit mode: ${flags & ENABLE_QUICK_EDIT_MODE == ENABLE_QUICK_EDIT_MODE}');
}

void main() {
  final stdInHandle = GetStdHandle(STD_INPUT_HANDLE);

  // Regular console mode
  print('Normal mode flags:');
  final lpMode = calloc<Int32>();
  GetConsoleMode(stdInHandle, lpMode);
  printConsoleFlags(lpMode.value);

  // Raw console mode
  print('\nRaw mode flags:');
  stdin.rawMode = true;
  GetConsoleMode(stdInHandle, lpMode);
  printConsoleFlags(lpMode.value);

  calloc.free(lpMode);
}
