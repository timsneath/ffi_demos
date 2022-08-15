// ignore_for_file: unused_local_variable

import 'dart:ffi';

import 'stdin_raw.dart';

typedef GetConsoleModeC = Int32 Function(IntPtr, Pointer<Int32>);
typedef GetConsoleModeDart = int Function(int, Pointer<Int32>);

final kernel32 = DynamicLibrary.open('kernel32.dll');
final getConsoleMode = kernel32
    .lookupFunction<GetConsoleModeC, GetConsoleModeDart>('GetConsoleMode');

const STD_INPUT_HANDLE = -10;
const ENABLE_PROCESSED_INPUT = 0x0001;
const ENABLE_LINE_INPUT = 0x0002;
const ENABLE_ECHO_INPUT = 0x0004;
const ENABLE_WINDOW_INPUT = 0x0008;
const ENABLE_VIRTUAL_TERMINAL_INPUT = 0x0200;

void printConsoleFlags(int flags) {
  print('Echo: ${flags & ENABLE_ECHO_INPUT == ENABLE_ECHO_INPUT}');
  print('Line input: ${flags & ENABLE_LINE_INPUT == ENABLE_LINE_INPUT}');
  print(
      'Process input: ${flags & ENABLE_PROCESSED_INPUT == ENABLE_PROCESSED_INPUT}');
  print(
      'Console resize events: ${flags & ENABLE_WINDOW_INPUT == ENABLE_PROCESSED_INPUT}');
  print(
      'VT escape sequence input: ${flags & ENABLE_VIRTUAL_TERMINAL_INPUT == ENABLE_VIRTUAL_TERMINAL_INPUT}');
}

void main() {
  final stdInHandle = getStdHandle(STD_INPUT_HANDLE);

  // Add code here
}
