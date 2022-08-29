import 'dart:ffi';
import 'dart:io';

// The Windows kernel library, which exports these functions
final kernel32 = DynamicLibrary.open('kernel32.dll');

// HANDLE GetStdHandle(DWORD nStdHandle)
typedef GetStdHandle_C = IntPtr Function(Int32);
typedef GetStdHandle_Dart = int Function(int);
final GetStdHandle =
    kernel32.lookupFunction<GetStdHandle_C, GetStdHandle_Dart>('GetStdHandle');

// BOOL GetConsoleMode(HANDLE hConsoleHandle, LPDWORD lpMode)
typedef GetConsoleMode_C = Int32 Function(IntPtr, Pointer<Int32>);
typedef GetConsoleMode_Dart = int Function(int, Pointer<Int32>);
final GetConsoleMode = kernel32
    .lookupFunction<GetConsoleMode_C, GetConsoleMode_Dart>('GetConsoleMode');

// BOOL SetConsoleMode(HANDLE hConsoleHandle, DWORD dwMode)
typedef SetConsoleMode_C = Int32 Function(IntPtr, Int32);
typedef SetConsoleMode_Dart = int Function(int, int);
final SetConsoleMode = kernel32
    .lookupFunction<SetConsoleMode_C, SetConsoleMode_Dart>('SetConsoleMode');

const STD_INPUT_HANDLE = -10;
const ENABLE_PROCESSED_INPUT = 0x0001;
const ENABLE_LINE_INPUT = 0x0002;
const ENABLE_ECHO_INPUT = 0x0004;
const ENABLE_MOUSE_INPUT = 0x0010;
const ENABLE_INSERT_MODE = 0x0020;
const ENABLE_QUICK_EDIT_MODE = 0x0040;

// Use package:dart_console for a more polished version.
extension SetRawMode on Stdin {
  set rawMode(bool isRaw) {
    final stdin = GetStdHandle(STD_INPUT_HANDLE);

    if (isRaw) {
      SetConsoleMode(stdin,
          ENABLE_QUICK_EDIT_MODE | ENABLE_INSERT_MODE | ENABLE_MOUSE_INPUT);
    } else {
      SetConsoleMode(
          stdin,
          ENABLE_QUICK_EDIT_MODE |
              ENABLE_INSERT_MODE |
              ENABLE_MOUSE_INPUT |
              ENABLE_ECHO_INPUT |
              ENABLE_LINE_INPUT |
              ENABLE_PROCESSED_INPUT);
    }
  }
}
